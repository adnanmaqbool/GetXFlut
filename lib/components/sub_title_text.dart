import 'package:flutter/material.dart';

import '../provider/theme_provider.dart';

class SubTitleText extends StatelessWidget {
   SubTitleText({super.key, required this.title,  Color? textColor,  }) : textColor = textColor ?? ThemeProvider.textColor;

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {  
    return Text(title,
        style: const TextStyle(
          fontFamily: 'InterFont',
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ));
  }
}
