# Flutter Architecture Rules (Claude-Optimized)

## Priority: Performance > Simplicity > Clarity

---

## 📋 UI Layer

### Widgets

- ✅ **ONLY** `StatelessWidget`
- ❌ **NEVER** `StatefulWidget`
- ✅ **ALL** logic → Cubit
- ✅ One widget per file (`login_form.dart`)
- ✅ **MUST** separate screen sections into widgets

**Screen Structure:**
```dart
// ❌ WRONG - Everything in one screen
class HomeScreen extends StatelessWidget {
  Widget build(context) => Scaffold(
    appBar: AppBar(...), // Complex header
    body: Column([
      // 50+ lines of header section
      // 50+ lines of content section
      // 50+ lines of footer section
    ]),
  );
}

// ✅ CORRECT - Sections separated
class HomeScreen extends StatelessWidget {
  Widget build(context) => Scaffold(
    appBar: CustomAppBar(title: 'home'.tr()),
    body: Column([
      HomeHeader(),     // widgets/home_header.dart
      HomeContent(),    // widgets/home_content.dart
      HomeFooter(),     // widgets/home_footer.dart
    ]),
  );
}
```

**Rules:**
- Separate each major section (header, content, footer, forms, lists)
- Each widget in `widgets/` folder
- Max 50-70 lines per widget
- Improves readability and reusability

### Animations

```dart
import 'core/extensions/animations.dart';

Widget().fadeInSlide()              // Basic
Widget().formFieldAnimation(index)  // Forms (100ms stagger)
Widget().listItemAnimation(index)   // Lists (100ms stagger)
```

### Responsive Design

```dart
import 'core/helpers/responsive_helper.dart';

// Sizes: 100.w, 50.h, 16.sp, 8.r
// Spacing: 16.verticalSpace, 24.horizontalSpace
// Context: context.screenWidth, context.isTablet
```

### Localization

```dart
'text_key'.tr()  // ALL text must use this
```

### Navigation

**MUST** use context extensions (NEVER use Navigator directly)

```dart
import 'core/extensions/navigations.dart';

// ✅ CORRECT
context.push(AppRoutes.home);
context.pushReplacement(AppRoutes.login);
context.pushAndRemoveAll(AppRoutes.home);
context.pop();

// ❌ WRONG
Navigator.pushNamed(context, AppRoutes.home);
Navigator.pushReplacementNamed(context, AppRoutes.login);
Navigator.pop(context);
```

### State Pattern

```dart
BlocConsumer<FeatureCubit, FeatureState>(
  listener: (context, state) {
    if (state.isSuccess) context.go(...);
    if (state.isFailure) Utils.showErrorSnackBar(context, state.message);
  },
  builder: (context, state) {
    return state.isLoading ? Loader() : Widget();
  },
)
```

---

## 📋 Logic Layer

### Helper Classes (Optional)

**Create Helper class ONLY if:**

- Business logic is reused in multiple methods
- Complex calculations/transformations needed
- Validation logic is extensive

**Structure:**

```dart
class FeatureHelper {
  FeatureHelper._(); // Private constructor

  // Validation
  static bool isValidEmail(String email) => email.contains('@') && email.length > 5;

  // Transformation
  static String formatPhone(String phone) => phone.replaceAll(RegExp(r'\D'), '');

  // Calculation
  static double calculateTotal(List<Item> items) => items.fold(0, (sum, item) => sum + item.price);

  // Parsing
  static DateTime? parseDate(String? date) => date != null ? DateTime.tryParse(date) : null;
}
```

**Rules:**

- ✅ Static methods only (no state)
- ✅ Pure functions (same input = same output)
- ✅ Short, focused methods (max 10 lines)
- ✅ Meaningful names (`isValid`, `format`, `calculate`, `parse`)
- ✅ Place in `presentation/logic/` folder
- ❌ NO business logic that belongs in Cubit
- ❌ NO API calls or side effects

### Cubit Template

```dart
class FeatureCubit extends Cubit<FeatureState> {
  final FeatureRepo _repo;
  FeatureCubit(this._repo) : super(const FeatureState());

  // Variables
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();

  // Methods
  Future<void> action() async {
    if (!formKey.currentState!.validate()) {
      emit(const FeatureState(status: Status.failure, message: '...'));
      return;
    }

    emit(const FeatureState(status: Status.loading));

    final response = await _repo.method(request: Request(...));
    response.when(
      success: (data) => emit(FeatureState(status: Status.success, data: data)),
      failure: (error) => emit(FeatureState(status: Status.failure, message: error.message)),
    );
  }

  // Helpers
  void toggle() => emit(state.copyWith(isVisible: !state.isVisible));

  // Cleanup
  @override
  Future<void> close() {
    emailCtrl.dispose();
    return super.close();
  }
}
```

### BaseState (MANDATORY)

```dart
import 'core/states/base_state.dart';

class FeatureState extends BaseState<FeatureResponse> {
  final bool isVisible;

  const FeatureState({
    super.status = Status.initial,
    super.data,
    super.message,
    this.isVisible = false,
  });

  @override
  FeatureState copyWith({...}) => FeatureState(...);
}

// Usage:
state.isLoading ? Loader() :
state.isSuccess ? Success(state.data) :
state.isFailure ? Error(state.message) : Widget();
```

---

## 📋 Data Layer

### Folder Structure

```bash
data/
├── models/     # request.dart, response.dart
├── remote/     # api_service.dart
└── repos/      # repo.dart
```

### Request Model

```dart
class Request {
  final String email;
  Request({required this.email});
  Map<String, dynamic> toJson() => {'email': email};
}
```

### Response Model (Manual JSON Only)

```dart
class Response {
  final String token;
  final User? user;

  Response({required this.token, this.user});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      token: json['token'] as String,
      user: json['user'] != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
    );
  }
}
```

**📋 Rules:**

- Explicit casting: `as String`, `as int`, `as bool`
- Ternary for nullable nested objects
- ❌ NO code generation
- ❌ NO `@JsonSerializable()`

### API Service (Retrofit)

```dart
@RestApi()
abstract class FeatureApi {
  factory FeatureApi(Dio dio) = _FeatureApi;

  @POST(ApiUrls.endpoint)
  Future<ApiBaseResponse<Response>> method(@Body() Request request);
}
```

### Repository

```dart
class FeatureRepo {
  final FeatureApi _api;
  FeatureRepo(this._api);

  Future<ApiResult<Response>> method({required Request request}) {
    return ApiUtils.executeRepoCall<Response>(
      call: () => _api.method(request),
      name: 'Feature',
      mapper: (response) => response.data,
    );
  }
}
```

---

## 📋 Dependency Injection

### Generic Registration Pattern

```dart
void registerServiceAndRepo<TApi, TRepo>({
  required TApi Function(Dio dio) apiService,
  required TRepo Function(TApi service) repo,
}) {
  if (!getIt.isRegistered<TApi>()) {
    getIt.registerLazySingleton<TApi>(() => apiService(getIt<Dio>()));
  }
  if (!getIt.isRegistered<TRepo>()) {
    getIt.registerLazySingleton<TRepo>(() => repo(getIt<TApi>()));
  }
}
```

### Setup

```dart
final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Register modules
  registerServiceAndRepo<LoginApiService, LoginRepo>(
    apiService: (dio) => LoginApiService(dio),
    repo: (service) => LoginRepo(service),
  );
}
```

### Router Integration

```dart
AppRoutes.login: (_) => BlocProvider(
  create: (_) => LoginCubit(getIt<LoginRepo>()),
  child: const LoginScreen(),
),
```

**Why no Cubit in DI?** Prevents memory leaks and stale state.

---

## 📋 Code Standards

### Naming

| Type | Format | Example |
|------|--------|---------|
| Files | `snake_case.dart` | `login_screen.dart` |
| Classes | `PascalCase` | `LoginScreen` |
| Variables | `camelCase` | `emailController` |
| Global const | `SCREAMING_SNAKE_CASE` | `API_TIMEOUT` |

### Import Order

```dart
// 1. Dart imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Packages (alphabetical)
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// 4. Project files (alphabetical)
import '../logic/feature_cubit.dart';
import 'widgets/feature_form.dart';
```

### Code Organization

```dart
// MARK: - Variables
// MARK: - Methods
// MARK: - Helpers
// MARK: - API Calls
```

### Performance

- ✅ `const` constructors everywhere
- ✅ `RepaintBoundary` for forms/animations
- ✅ `ListView.builder` for long lists
- ✅ Dispose controllers in `close()`

---

## 📦 Tech Stack

- **State:** flutter_bloc (Cubit only)
- **DI:** get_it
- **Network:** dio + retrofit
- **UI:** ResponsiveHelper, flutter_animate
- **i18n:** easy_localization
- **JSON:** Manual serialization

---

## ✅ Quick Checklist

- [ ] StatelessWidget only
- [ ] Logic in Cubit only
- [ ] **Screen sections separated into widgets** (max 50-70 lines each)
- [ ] Extends `BaseState<T>`
- [ ] Responsive helpers used (`.w`, `.h`, `.sp`)
- [ ] `.tr()` for all text
- [ ] `context.push()` / `context.pop()` for navigation (NEVER Navigator)
- [ ] Animations with 100ms stagger
- [ ] `const` constructors
- [ ] Controllers disposed in `close()`
- [ ] Uses `registerServiceAndRepo<TApi, TRepo>()`
- [ ] Cubit NOT in GetIt
- [ ] Import order correct
- [ ] Manual JSON (no code gen)
- [ ] MARK comments added
- [ ] Helper class created if needed (validation/calculation/transformation)
- [ ] Helper methods are static and pure functions
