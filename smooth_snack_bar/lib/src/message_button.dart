import 'package:flutter/material.dart';

/// A simple text button widget designed to be used within a [SmoothSnackBar].
class MessageButton extends StatelessWidget {
  /// The label text to display on the button.
  final String title;

  /// The callback function to execute when the button is tapped.
  final VoidCallback function;

  /// Creates a [MessageButton].
  const MessageButton({
    super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
