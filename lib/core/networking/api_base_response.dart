class ApiBaseResponse<T> {
  final T? data;
  final String? message;
  final bool? success;

  ApiBaseResponse({
    this.data,
    this.message,
    this.success,
  });

  factory ApiBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiBaseResponse<T>(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );
  }
}
