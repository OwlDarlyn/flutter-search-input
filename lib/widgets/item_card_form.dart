import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class ItemCardForm extends StatelessWidget {
  final String leading;
  final String title;
  final String subtitle;
  const ItemCardForm(
      {super.key,
      required this.leading,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.defaultBackColor,
      child: Container(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              leading,
              style:
                  const TextStyle(color: AppColors.defaultColor, fontSize: 16),
            ),
            Text(title,
                style: const TextStyle(
                    color: AppColors.accentColor1, fontSize: 16)),
            Text(subtitle,
                style:
                    const TextStyle(color: AppColors.helpColor1, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
