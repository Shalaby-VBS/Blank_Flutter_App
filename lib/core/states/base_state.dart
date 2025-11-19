import 'package:flutter/foundation.dart';

/// Generic status for all Cubits
enum Status { initial, loading, success, failure }

/// Base reusable state for any Cubit
@immutable
class BaseState<T> {
  final Status status;
  final T? data;
  final String? message;

  const BaseState({
    this.status = Status.initial,
    this.data,
    this.message,
  });

  bool get isInitial => status == Status.initial;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isFailure => status == Status.failure;

  BaseState<T> copyWith({
    Status? status,
    T? data,
    String? message,
  }) {
    return BaseState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
