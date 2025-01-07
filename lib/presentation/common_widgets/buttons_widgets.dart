import 'package:flutter/material.dart';
import 'package:money_flow/core/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget widget;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.widget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(color: aliceBlue, borderRadius: BorderRadius.circular(12)),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            Text(text, style: bodySmallRTS.copyWith(color: blue500)),
          ],
        ),
      ),
    );
  }
}
