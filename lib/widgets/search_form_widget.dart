import 'package:flutter/material.dart';
import 'package:popsy_test_assignment/models/app_colors.dart';

class SearchForm extends StatelessWidget {
  SearchForm({super.key});

  final TextEditingController searchController = TextEditingController();

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
        controller: searchController,
        onChanged: (_) {},
        textInputAction: TextInputAction.done,
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
