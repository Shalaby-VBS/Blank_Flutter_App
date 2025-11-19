import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blank_flutter_project/modules/onboarding/presentation/logic/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  // Variables
  final PageController pageController = PageController();

  // Methods
  void onPageChanged(int page) {
    emit(state.copyWith(currentPage: page));
  }

  void nextPage() {
    if (state.isLastPage) return;
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skipToEnd() {
    pageController.animateToPage(
      state.totalPages - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Cleanup
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
