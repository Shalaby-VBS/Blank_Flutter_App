class ApiErrorModel {
  final String? message;
  final int? code;
  final dynamic errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      errors: json['data'] ?? json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      // ignore: unrelated_type_equality_checks
      errors is Map<String, dynamic> == 'data' ? errors : 'errors': errors,
    };
  }

  /// Returns a String containing all the error messages
  String getAllErrorMessages() {
    if (errors == null) return message ?? "Unknown Error occurred";

    if (errors is String) {
      return errors;
    } else if (errors is Map<String, dynamic>) {
      return errors.entries
          .map((e) => e.value is List ? e.value.join(',') : e.value.toString())
          .join('\n');
    } else if (errors is List) {
      return errors.join('\n');
    }

    return message ?? "Unknown Error occurred";
  }
}
