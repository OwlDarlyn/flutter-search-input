import 'package:flutter/material.dart';

import '../api/elixirs_api.dart';
import '../models/elixirs_model.dart';

class ElixirsProvider extends ChangeNotifier {
  List<Elixir> _elixirs = [];
  String _searchElixirString = '';

  List<Elixir> get elixirs => _elixirs;
  String get searchElixirString => _searchElixirString;

  void getElixirs() async {
    _elixirs = await fetchElixirs();
    notifyListeners();
  }

  void searchElixir(String param) {
    _searchElixirString = param;
    notifyListeners();
  }
}
