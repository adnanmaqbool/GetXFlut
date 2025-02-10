

import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.iconData,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(iconData),
          onTap: onTap,
        ),
      ),
    );
  }
}
