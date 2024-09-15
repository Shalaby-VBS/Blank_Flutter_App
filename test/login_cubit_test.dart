import 'package:blank_flutter_project/core/logic/base_state.dart';
import 'package:blank_flutter_project/core/networking/api_error_model.dart';
import 'package:blank_flutter_project/core/networking/api_result.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_response.dart';
import 'package:blank_flutter_project/modules/login/api/repos/login_repo.dart';
import 'package:blank_flutter_project/modules/login/logic/login_cubit.dart';
import 'package:blank_flutter_project/modules/login/logic/login_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_request_body.dart';

// Mock LoginRepo
class MockLoginRepo extends Mock implements LoginRepo {}

// Fake LoginRequestBody
class FakeLoginRequestBody extends Fake implements LoginRequestBody {}

void main() {
  late MockLoginRepo mockLoginRepo;
  late LoginCubit loginCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(FakeLoginRequestBody());
  });

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    loginCubit = LoginCubit(mockLoginRepo);
  });

  tearDown(() async {
    await loginCubit.close();
  });

  group(
    'LoginCubit Tests',
    () {
      blocTest<LoginCubit, LoginState>(
        'emits [LoadingState, SuccessState] when login succeeds',
        build: () {
          when(() => mockLoginRepo.login(any())).thenAnswer(
            (_) async => Success(
              LoginResponse(token: 'dummy_token'),
            ),
          );
          return loginCubit;
        },
        act: (cubit) {
          cubit.emailController.text = 'test@example.com';
          cubit.passwordController.text = 'password';
          cubit.attemptLogin();
        },
        expect: () => [
          isA<LoadingState>(),
          isA<SuccessState>(),
        ],
      );

      blocTest<LoginCubit, LoginState>(
        'emits [LoadingState, ErrorState] when login fails',
        build: () {
          when(() => mockLoginRepo.login(any())).thenAnswer(
              (_) async => Failure(ApiErrorModel(message: 'Login failed')));
          return loginCubit;
        },
        act: (cubit) {
          cubit.emailController.text = 'test@example.com';
          cubit.passwordController.text = 'wrong_password';
          cubit.attemptLogin();
        },
        expect: () => [
          isA<LoadingState>(),
          isA<ErrorState<ApiErrorModel>>(),
        ],
      );
    },
  );
}
