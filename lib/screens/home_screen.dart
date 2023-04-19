import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/elixirs_model.dart';
import '../models/spell_model.dart';
import '../models/wizard_model.dart';
import '../provider/elixirs_provider.dart';
import '../provider/spells_provider.dart';
import '../provider/wizards_provider.dart';
import '../widgets/elixirs_listview_form.dart';
import '../widgets/spells_listview_form.dart';
import '../widgets/tabbar_form_widget.dart';
import '../widgets/search_form_widget.dart';
import '../widgets/wizards_listview_form.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  void initState() {
    super.initState();
    context.read<ElixirsProvider>().getElixir();
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            {
              context.read<ElixirsProvider>().getElixir();
              break;
            }
          case 1:
            {
              context.read<WizardsProvider>().getWizard();
              break;
            }
          case 2:
            {
              context.read<SpellsProvider>().getSpell();
              break;
            }
          default:
            {
              log("hello world");
              break;
            }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Elixir> elixirs = context.watch<ElixirsProvider>().elixirs;
    final List<Wizard> wizards = context.watch<WizardsProvider>().wizards;
    final List<Spell> spells = context.watch<SpellsProvider>().spells;

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
                ElixirsListViewForm(list: elixirs),
                WizardsListViewForm(list: wizards),
                SpellsListViewForm(list: spells),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
