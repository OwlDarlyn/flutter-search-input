import 'package:flutter/material.dart';
import 'package:popsy_test_assignment/screens/elixir_item_screen.dart';

import '../models/app_colors.dart';
import '../models/elixirs_model.dart';

class ItemCardForm extends StatelessWidget {
  final Elixir elixir;

  const ItemCardForm({super.key, required this.elixir});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ElixirItemScreen(
                    selectedElixir: elixir,
                  ))),
      child: Card(
        color: AppColors.defaultBackColor,
        child: Container(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                elixir.name,
                style: const TextStyle(
                    color: AppColors.defaultColor, fontSize: 16),
              ),
              Text(elixir.effect,
                  style: const TextStyle(
                      color: AppColors.accentColor1, fontSize: 16)),
              Text(elixir.difficulty,
                  style: const TextStyle(
                      color: AppColors.helpColor1, fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}
