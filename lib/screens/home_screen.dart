import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/elixirs_model.dart';
import '../provider/elixirs_provider.dart';
import '../widgets/elixirs_listview_form.dart';
import '../widgets/tabbar_form_widget.dart';

import '../widgets/search_form_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<ElixirsProvider>().getElixir();
  }

  @override
  Widget build(BuildContext context) {
    final List<Elixir> elixirs = context.watch<ElixirsProvider>().elixirs;
    final TabController _tabController = TabController(length: 3, vsync: this);

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
                'WizardWorld',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor1),
              ),
            ),
            SearchForm(),
            TabBarForm(tabController: _tabController),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                ListViewForm(list: elixirs),
                Tab(text: 'You'),
                Tab(text: 'Bye'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
