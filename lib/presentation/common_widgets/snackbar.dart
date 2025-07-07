import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    IconData icon = Icons.check_circle,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
  }) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
