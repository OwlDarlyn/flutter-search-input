import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';

import '../models/spell_model.dart';
import '../provider/spells_provider.dart';
import '../widgets/item_card_form.dart';

class SpellsListViewForm extends StatefulWidget {
  final List<dynamic> list;

  const SpellsListViewForm({super.key, required this.list});

  @override
  State<SpellsListViewForm> createState() => _SpellsListViewFormState();
}

class _SpellsListViewFormState extends State<SpellsListViewForm>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Spell> spells = context.watch<SpellsProvider>().spells;

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.helpColor1.withOpacity(0.4),
      ),
      child: ListView.builder(
          itemCount: spells.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemCardForm(
                  leading: spells[index].name,
                  title: spells[index].effect,
                  subtitle: spells[index].creator,
                ),
              ],
            );
          }),
    );
  }
}
