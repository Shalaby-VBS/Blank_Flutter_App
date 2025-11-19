import 'package:flutter/foundation.dart';

import 'package:blank_flutter_project/core/states/base_state.dart';

@immutable
class OnboardingState extends BaseState<void> {
  final int currentPage;
  final int totalPages;

  const OnboardingState({
    super.status = Status.initial,
    super.message,
    this.currentPage = 0,
    this.totalPages = 3,
  });

  bool get isLastPage => currentPage == totalPages - 1;
  bool get isFirstPage => currentPage == 0;

  @override
  OnboardingState copyWith({
    Status? status,
    void data,
    String? message,
    int? currentPage,
    int? totalPages,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      message: message ?? this.message,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
