import 'package:flut_getx/components/title_text.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    required this.onBack,
    this.centerTitle = false,
    this.isBackIcon = true,
    this.backIcon = Icons.arrow_back, // Default back icon
    this.backGroundColor,
  });

  final String title;
  final bool centerTitle;
  final VoidCallback onBack;
  final bool isBackIcon;
  final IconData backIcon;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor ?? Theme.of(context).colorScheme.background,
      centerTitle: centerTitle,
      title: TitleText(title: title),
      leading: isBackIcon
          ? IconButton(
        icon: Icon(backIcon, color: Theme.of(context).iconTheme.color),
        onPressed: onBack,
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
