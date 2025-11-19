import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blank_flutter_project/core/extensions/animations.dart';
import 'package:blank_flutter_project/core/extensions/navigations.dart';
import 'package:blank_flutter_project/core/helpers/responsive_helper.dart';
import 'package:blank_flutter_project/core/routing/app_routes.dart';
import 'package:blank_flutter_project/core/themes/app_colors.dart';
import 'package:blank_flutter_project/core/widgets/custom_button.dart';
import 'package:blank_flutter_project/modules/onboarding/presentation/logic/onboarding_cubit.dart';
import 'package:blank_flutter_project/modules/onboarding/presentation/logic/onboarding_state.dart';
import 'package:blank_flutter_project/modules/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:blank_flutter_project/modules/onboarding/presentation/widgets/page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();

            return Column(
              children: [
                // Skip Button
                if (!state.isLastPage)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: cubit.skipToEnd,
                      child: Text(
                        'skip'.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.neutral600,
                        ),
                      ),
                    ).fadeInSlide(delay: 300),
                  ),

                // PageView
                Expanded(
                  child: PageView(
                    controller: cubit.pageController,
                    onPageChanged: cubit.onPageChanged,
                    children: [
                      OnboardingPage(
                        icon: Icons.directions_car_rounded,
                        title: 'onboarding_title_1'.tr(),
                        description: 'onboarding_desc_1'.tr(),
                      ),
                      OnboardingPage(
                        icon: Icons.location_on_rounded,
                        title: 'onboarding_title_2'.tr(),
                        description: 'onboarding_desc_2'.tr(),
                      ),
                      OnboardingPage(
                        icon: Icons.payment_rounded,
                        title: 'onboarding_title_3'.tr(),
                        description: 'onboarding_desc_3'.tr(),
                      ),
                    ],
                  ),
                ),

                // Page Indicator
                PageIndicator(
                  currentPage: state.currentPage,
                  totalPages: state.totalPages,
                ).fadeInSlide(delay: 500),

                32.verticalSpace,

                // Action Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomButton(
                    title: state.isLastPage ? 'get_started'.tr() : 'next'.tr(),
                    onPressed: () async {
                      if (state.isLastPage) {
                        if (context.mounted) {
                          context.pushAndRemoveAll(AppRoutes.login);
                        }
                      } else {
                        cubit.nextPage();
                      }
                    },
                  ).fadeInSlide(delay: 700),
                ),

                24.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
