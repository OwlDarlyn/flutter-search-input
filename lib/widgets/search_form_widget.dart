import 'package:flutter/material.dart';
import 'package:popsy_test_assignment/models/app_colors.dart';
import 'package:popsy_test_assignment/provider/elixirs_provider.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.helpColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        onChanged: (value) =>
            context.read<ElixirsProvider>().searchElixir(value),
        textInputAction: TextInputAction.done,
        style: const TextStyle(color: AppColors.defaultColor, fontSize: 16),
        maxLines: 1,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.search,
            color: AppColors.helpColor2,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.accentColor2,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
