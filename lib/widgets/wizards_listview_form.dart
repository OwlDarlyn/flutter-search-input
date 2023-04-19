import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/wizard_model.dart';
import '../provider/wizards_provider.dart';
import '../widgets/item_card_form.dart';

class WizardsListViewForm extends StatefulWidget {
  final List<dynamic> list;

  const WizardsListViewForm({super.key, required this.list});

  @override
  State<WizardsListViewForm> createState() => _WizardsListViewFormState();
}

class _WizardsListViewFormState extends State<WizardsListViewForm>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Wizard> wizards = context.watch<WizardsProvider>().wizards;

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.helpColor1.withOpacity(0.4),
      ),
      child: ListView.builder(
          itemCount: wizards.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemCardForm(
                    leading: wizards[index].firstName + wizards[index].lastName,
                    title: '',
                    subtitle: ''),
              ],
            );
          }),
    );
  }
}
