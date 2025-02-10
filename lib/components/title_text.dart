import 'package:flutter/material.dart';

import '../provider/theme_provider.dart';

class TitleText extends StatelessWidget {
   TitleText({super.key, required this.title,  Color? textColor, }) : textColor = textColor ?? ThemeProvider.textColor;

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
          fontFamily: 'InterFont',
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ));
  }
}
