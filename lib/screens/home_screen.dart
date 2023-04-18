import 'package:flutter/material.dart';
import 'package:popsy_test_assignment/widgets/tabbar_form_widget.dart';

import '../models/app_colors.dart';
import '../widgets/search_form_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: const Text(
                'WizardWorld',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor1),
              ),
            ),
            SearchForm(),
            TabBarForm(),
          ],
        ),
      ),
    );
  }
}
