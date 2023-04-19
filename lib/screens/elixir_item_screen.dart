import 'package:flutter/material.dart';
import 'package:popsy_test_assignment/screens/home_screen.dart';

import '../models/elixirs_model.dart';
import '../models/app_colors.dart';

class ElixirItemScreen extends StatelessWidget {
  final Elixir selectedElixir;
  const ElixirItemScreen({super.key, required this.selectedElixir});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.helpColor1.withOpacity(0.4),
        ),
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5, right: 10),
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
            ),
            Text(
              selectedElixir.name,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor1),
            ),
            Card(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              color: AppColors.defaultBackColor,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Effect:',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    selectedElixir.effect != ''
                        ? Text(
                            selectedElixir.effect,
                            style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.accentColor1,
                                fontWeight: FontWeight.bold),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 10),
                    const Text('Side effects:',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                      selectedElixir.sideEffects,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.helpColor1),
                    ),
                    const SizedBox(height: 10),
                    const Text('Difficulty:',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                      selectedElixir.difficulty,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.helpColor1),
                    ),
                    const SizedBox(height: 10),
                    const Text('Ingredients:',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Container(
                      height: 150,
                      child: selectedElixir.ingredients.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: selectedElixir.ingredients.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  selectedElixir.ingredients[index].name,
                                  style: const TextStyle(
                                      color: AppColors.accentColor1,
                                      decoration: TextDecoration.underline,
                                      fontSize: 16),
                                );
                              },
                            )
                          : const Text('Unknown',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.helpColor1)),
                    ),
                    const Text('Inventors:',
                        style: TextStyle(
                            color: AppColors.defaultColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Container(
                      height: 150,
                      child: selectedElixir.inventors.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: selectedElixir.inventors.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(
                                  selectedElixir.inventors[index].firstName,
                                  style: const TextStyle(
                                      color: AppColors.accentColor1),
                                ));
                              },
                            )
                          : const Text('Unknown',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.helpColor1)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
