import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api/elixirs_api.dart';
import '../models/elixirs_model.dart';

class ElixirsProvider extends ChangeNotifier {
  List<Elixir> _elixirs = [];
  String _searchElixirString = '';

  final Elixir _selectedElixirs = Elixir(
    id: '',
    name: '',
    effect: '',
    sideEffects: '',
    difficulty: '',
    ingredients: [],
    inventors: [],
    manufacturer: '',
  );

  List<Elixir> get elixirs => _elixirs;
  String get searchElixirString => _searchElixirString;

  void getElixir() async {
    _elixirs = await fetchElixirs();
    notifyListeners();
  }

  void searchElixir(String param) {
    _searchElixirString = param;
    notifyListeners();
  }
}
