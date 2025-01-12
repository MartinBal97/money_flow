import 'package:flutter/material.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backGroundcolor;
  final Color? textColor;

  const MainButton({
    super.key,
    required this.text,
    this.onTap,
    this.backGroundcolor = blue500,
    this.textColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p12)),
          ),
          backgroundColor: WidgetStatePropertyAll(backGroundcolor),
        ),
        onPressed: onTap,
        child: Text(text, style: buttonsTS.copyWith(color: textColor)),
      ),
    );
  }
}

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
