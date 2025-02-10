import 'package:flutter/material.dart';

import '../provider/theme_provider.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    super.key,
    Color? textColor,
    Color? buttonColor,
    this.loading = false,
    required this.title,
    required this.onPressed,
    this.width = 300,
    this.height = 90,
  })  : textColor = textColor ?? ThemeProvider.textColor,
        buttonColor = buttonColor ?? ThemeProvider.backgroundColor;

  final bool loading;
  final String title;
  final VoidCallback onPressed;
  final Color textColor, buttonColor;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
