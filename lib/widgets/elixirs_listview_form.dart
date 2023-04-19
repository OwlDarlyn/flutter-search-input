import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:popsy_test_assignment/widgets/item_card_form.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/elixirs_model.dart';
import '../provider/elixirs_provider.dart';

class ListViewForm extends StatefulWidget {
  final List<dynamic> list;

  const ListViewForm({super.key, required this.list});

  @override
  State<ListViewForm> createState() => _ListViewFormState();
}

class _ListViewFormState extends State<ListViewForm>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Elixir> elixirs = context.watch<ElixirsProvider>().elixirs;

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.helpColor1.withOpacity(0.4),
      ),
      child: ListView.builder(
          itemCount: elixirs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemCardForm(
                    leading: elixirs[index].name,
                    title: elixirs[index].effect,
                    subtitle: elixirs[index].difficulty),
              ],
            );
          }),
    );
  }
}
