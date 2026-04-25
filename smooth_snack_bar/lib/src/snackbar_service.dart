import 'package:flutter/material.dart';
import 'package:smooth_snack_bar/src/message_button.dart';
import 'package:smooth_snack_bar/src/message_widget.dart';

/// A service class to display smooth and customizable snack bars using Overlay.
class SmoothSnackBar {
  /// Displays a snack bar with various customization options.
  ///
  /// [context] is required to find the [Overlay].
  /// [title] is the main message to display.
  /// [onTitle] allows providing a custom widget instead of the default [title] text.
  /// [isDanger] if true, applies danger styling (e.g., specific icon).
  /// [button] an optional action button of type [MessageButton].
  /// [duration] how long the snack bar stays visible. Defaults to 3 seconds.
  /// [icon] a string key to determine which icon to show ('success', 'warning', 'info', 'danger').
  /// [isDismissible] if true, allows the snack bar to be dismissed by vertical drag.
  /// [fromTop] if true, the snack bar appears from the top of the screen.
  /// [onTap] a callback function when the snack bar is tapped.
  static void show(
    BuildContext context, {
    required String title,
    Widget? onTitle,
    bool? isDanger,
    MessageButton? button,
    Duration? duration,
    SnackBarType? icon,
    bool isDismissible = true,
    bool fromTop = false,
    VoidCallback? onTap,
  }) {
    OverlayEntry? overlayEntry;
    final overlay = Overlay.of(context);

    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 400),
    );

    final animation = Tween<Offset>(
      begin: fromTop ? const Offset(0, -1.5) : const Offset(0, 2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.fastEaseInToSlowEaseOut));

    double dragOffset = 0;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: fromTop ? 16 + MediaQuery.paddingOf(context).top : null,
          bottom: fromTop ? null : 16 + MediaQuery.paddingOf(context).bottom,
          left: 16,
          right: 16,
          child: GestureDetector(
            onTap: () async {
              await animationController.reverse();
              overlayEntry?.remove();
              animationController.dispose();

              onTap?.call();
            },
            onVerticalDragUpdate: isDismissible
                ? (details) {
                    dragOffset += details.delta.dy;

                    if (dragOffset > 40) {
                      animationController.reverse().then((_) {
                        overlayEntry?.remove();
                        animationController.dispose();
                      });
                    }
                  }
                : null,
            child: SlideTransition(
              position: animation,
              child: Material(
                color: Colors.transparent,
                child: MessageWidget(
                  message: title,
                  isDanger: isDanger,
                  button: button,
                  icon: icon,
                  onTitle: onTitle,
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
    animationController.forward();

    Future.delayed(duration ?? const Duration(seconds: 3), () async {
      if (overlayEntry != null) {
        await animationController.reverse();
        overlayEntry?.remove();
        animationController.dispose();
        overlayEntry = null;
      }
    });
  }
}
