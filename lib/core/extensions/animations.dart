import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimationsExtension on Widget {
  Widget fadeInSlide({
    int delay = 0,
    int duration = 500,
    double slideOffset = 0.2,
    Curve curve = Curves.easeOutQuart,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: duration.ms)
        .slideY(
          begin: slideOffset,
          end: 0,
          duration: duration.ms,
          curve: curve,
        );
  }

  /// Fade in with slide from left
  /// Perfect for headers and side elements
  Widget fadeInSlideLeft({
    int delay = 0,
    int duration = 600,
    double slideOffset = -0.2,
    Curve curve = Curves.easeOutQuint,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: duration.ms)
        .slideX(
          begin: slideOffset,
          end: 0,
          duration: duration.ms,
          curve: curve,
        );
  }

  /// Fade in with slide from right
  /// Perfect for action buttons and trailing elements
  Widget fadeInSlideRight({
    int delay = 0,
    int duration = 600,
    double slideOffset = 0.2,
    Curve curve = Curves.easeOutQuint,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: duration.ms)
        .slideX(
          begin: slideOffset,
          end: 0,
          duration: duration.ms,
          curve: curve,
        );
  }

  /// Fade in with scale (perfect for icons and images)
  Widget fadeInScale({
    int delay = 0,
    int fadeDuration = 500,
    int scaleDuration = 600,
    Curve curve = Curves.easeOutBack,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: fadeDuration.ms)
        .scale(
          duration: scaleDuration.ms,
          curve: curve,
        );
  }

  /// Fade in only (simple and clean)
  Widget fadeInOnly({
    int delay = 0,
    int duration = 400,
  }) {
    return animate(delay: delay.ms).fadeIn(duration: duration.ms);
  }

  /// Default form field animation pattern
  /// Used for text fields, buttons in forms
  Widget formFieldAnimation({
    int index = 0,
  }) {
    return fadeInSlide(
      delay: index * 100,
      duration: 500,
      slideOffset: 0.2,
    );
  }

  /// List item animation pattern
  /// Used for list items with stagger effect
  Widget listItemAnimation({
    int index = 0,
    int baseDelay = 0,
  }) {
    return fadeInSlide(
      delay: baseDelay + (index * 80),
      duration: 400,
      slideOffset: 0.15,
    );
  }

  // ==================== Bottom Animations ====================

  /// Fade in with slide from bottom
  /// Perfect for bottom sheets, modals, and FABs
  Widget fadeInSlideBottom({
    int delay = 0,
    int duration = 500,
    double slideOffset = 0.3,
    Curve curve = Curves.easeOutQuart,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: duration.ms)
        .slideY(
          begin: slideOffset,
          end: 0,
          duration: duration.ms,
          curve: curve,
        );
  }

  /// Slide up from bottom (no fade)
  /// Perfect for snackbars and bottom navigation
  Widget slideUpFromBottom({
    int delay = 0,
    int duration = 400,
    Curve curve = Curves.easeOutCubic,
  }) {
    return animate(delay: delay.ms).slideY(
      begin: 1.0,
      end: 0,
      duration: duration.ms,
      curve: curve,
    );
  }

  // ==================== Interactive Animations ====================

  /// Bounce animation
  /// Perfect for buttons, success states, and interactive elements
  Widget bounce({
    int delay = 0,
    int duration = 600,
  }) {
    return animate(delay: delay.ms).scale(
      begin: const Offset(0.8, 0.8),
      end: const Offset(1.0, 1.0),
      duration: duration.ms,
      curve: Curves.elasticOut,
    );
  }

  /// Pulse animation (scale up and down)
  /// Perfect for notifications, badges, and attention grabbers
  Widget pulse({
    int delay = 0,
    double scale = 1.1,
  }) {
    return animate(delay: delay.ms)
        .scale(
          end: Offset(scale, scale),
          duration: 800.ms,
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          end: const Offset(1.0, 1.0),
          duration: 800.ms,
          curve: Curves.easeInOut,
        );
  }

  /// Shimmer/Loading animation
  /// Perfect for skeleton loaders
  Widget shimmer({
    int delay = 0,
  }) {
    return animate(delay: delay.ms, onComplete: (controller) {
      controller.repeat();
    }).shimmer(
      duration: 1500.ms,
      color: Colors.white.withValues(alpha: 0.5),
    );
  }

  // ==================== Scale Animations ====================

  /// Scale in (for dialogs and pop-ups)
  Widget scaleIn({
    int delay = 0,
    int duration = 300,
    Curve curve = Curves.easeOutBack,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: duration.ms)
        .scale(
          begin: const Offset(0.0, 0.0),
          end: const Offset(1.0, 1.0),
          duration: duration.ms,
          curve: curve,
        );
  }

  /// Pop animation (quick scale)
  /// Perfect for icon buttons and quick interactions
  Widget pop({
    int delay = 0,
    int duration = 200,
  }) {
    return animate(delay: delay.ms).scale(
      begin: const Offset(0.9, 0.9),
      end: const Offset(1.0, 1.0),
      duration: duration.ms,
      curve: Curves.easeOut,
    );
  }

  // ==================== Rotation Animations ====================

  /// Rotate animation
  /// Perfect for refresh icons and loading spinners
  Widget rotateIn({
    int delay = 0,
    int duration = 600,
    double rotation = 0.25,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: duration.ms)
        .rotate(
          begin: rotation,
          end: 0,
          duration: duration.ms,
          curve: Curves.easeOut,
        );
  }

  /// Spin continuously (for loaders)
  Widget spin({
    int duration = 1000,
  }) {
    return animate(onComplete: (controller) {
      controller.repeat();
    }).rotate(
      duration: duration.ms,
    );
  }

  // ==================== Complex/Combined Animations ====================

  /// Success animation (scale + fade with bounce)
  /// Perfect for success icons and confirmations
  Widget successAnimation({
    int delay = 0,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: 400.ms)
        .scale(
          begin: const Offset(0.0, 0.0),
          end: const Offset(1.2, 1.2),
          duration: 400.ms,
          curve: Curves.easeOut,
        )
        .then()
        .scale(
          end: const Offset(1.0, 1.0),
          duration: 200.ms,
          curve: Curves.easeInOut,
        );
  }

  /// Error animation (fade + scale)
  /// Perfect for error icons and failed states
  Widget errorAnimation({
    int delay = 0,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: 300.ms)
        .scale(
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
          duration: 400.ms,
          curve: Curves.easeOut,
        );
  }

  /// Attention seeker (pulse animation)
  /// Perfect for important notifications
  Widget attentionSeeker({
    int delay = 0,
  }) {
    return animate(delay: delay.ms)
        .fadeIn(duration: 400.ms)
        .then()
        .scale(
          end: const Offset(1.08, 1.08),
          duration: 400.ms,
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          end: const Offset(1.0, 1.0),
          duration: 400.ms,
          curve: Curves.easeInOut,
        );
  }

  // ==================== Flip Animations ====================

  /// Flip animation (for cards)
  Widget flipIn({
    int delay = 0,
    int duration = 600,
    Axis direction = Axis.horizontal,
  }) {
    return animate(delay: delay.ms).fadeIn(duration: duration.ms).flip(
          duration: duration.ms,
          curve: Curves.easeOut,
        );
  }

  // ==================== Blur Animations ====================

  /// Blur in animation
  /// Perfect for backgrounds and overlays
  Widget blurIn({
    int delay = 0,
    int duration = 500,
    double blur = 5.0,
  }) {
    return animate(delay: delay.ms).blur(
      begin: Offset(blur, blur),
      end: const Offset(0, 0),
      duration: duration.ms,
    );
  }
}
