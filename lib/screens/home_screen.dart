import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/elixirs_model.dart';
import '../provider/elixirs_provider.dart';
import '../widgets/elixirs_listview.dart';
import '../widgets/search_form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<ElixirsProvider>().getElixirs();
  }

  @override
  Widget build(BuildContext context) {
    final List<Elixir> elixirs = context.watch<ElixirsProvider>().elixirs;

    // log(elixirs[0].difficulty.toString());
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: const Text(
                'Wizard potions',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor1),
              ),
            ),
            const SearchForm(),
            Expanded(
              child: ElixirsListViewForm(list: elixirs),
            ),
          ],
        ),
      ),
    );
  }
}
