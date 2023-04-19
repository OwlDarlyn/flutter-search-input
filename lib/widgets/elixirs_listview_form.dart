import 'dart:developer';

import 'package:flutter/material.dart';
import '../widgets/item_card_form.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/elixirs_model.dart';
import '../provider/elixirs_provider.dart';

class ElixirsListViewForm extends StatefulWidget {
  final List<dynamic> list;

  const ElixirsListViewForm({super.key, required this.list});

  @override
  State<ElixirsListViewForm> createState() => _ElixirsListViewFormState();
}

class _ElixirsListViewFormState extends State<ElixirsListViewForm>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Elixir> elixirs = context.watch<ElixirsProvider>().elixirs;
    final String search = context.watch<ElixirsProvider>().searchElixirString;
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.helpColor1.withOpacity(0.4),
      ),
      child: ListView.builder(
          itemCount: elixirs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            if (elixirs[index]
                .name
                .toLowerCase()
                .contains(search.toLowerCase())) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemCardForm(
                    elixir: elixirs[index],
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
