import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/spell_model.dart';

import '../api/spells_api.dart';

class SpellsProvider extends ChangeNotifier {
  List<Spell> _spells = [];

  final Spell _selectedSpells = Spell(
      id: '',
      name: '',
      incantation: '',
      effect: '',
      canBeVerbal: false,
      type: '',
      light: '',
      creator: '');
  List<Spell> get spells => _spells;

  void getSpell() async {
    _spells = await fetchSpells();
    notifyListeners();
  }
}
