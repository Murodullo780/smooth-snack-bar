import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_snack_bar/src/message_button.dart';

/// A widget that represents the visual content of the snack bar.
class MessageWidget extends StatelessWidget {
  /// The main text message to display.
  final String message;

  /// Whether the snack bar represents a danger/error state.
  final bool? isDanger;

  /// An optional action button to display on the right side.
  final MessageButton? button;

  /// A string identifier for the icon to display ('success', 'warning', 'info', 'danger').
  final SnackBarType? icon;

  /// An optional custom widget to display instead of the default message text.
  final Widget? onTitle;

  /// Creates a [MessageWidget].
  const MessageWidget({
    super.key,
    required this.message,
    this.isDanger,
    this.button,
    this.icon,
    this.onTitle,
  });

  /// Resolves which [IconData] to use based on the [icon] string or [isDanger] flag.
  IconData _resolveIcon() {
    switch (icon) {
      case SnackBarType.success:
        return CupertinoIcons.checkmark_circle;
      case SnackBarType.warning:
        return CupertinoIcons.exclamationmark_triangle;
      case SnackBarType.info:
        return CupertinoIcons.info_circle;
      case SnackBarType.danger:
        return CupertinoIcons.exclamationmark_circle;
      default:
        return CupertinoIcons.info_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(BorderSide(color: Colors.black)),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        spacing: 8,
        children: [
          RotatedBox(
            quarterTurns: isDanger == true ? 4 : 0,
            child: Icon(_resolveIcon(), size: 24, color: Colors.black),
          ),
          Expanded(
            child:
                onTitle ??
                Text(
                  message,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          ),
          button ?? const SizedBox(),
        ],
      ),
    );
  }
}

enum SnackBarType { success, warning, info, danger }
