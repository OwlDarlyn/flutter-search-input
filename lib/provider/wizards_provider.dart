import 'package:flutter/material.dart';

import '../models/wizard_model.dart';
import '../api/wizards_api.dart';

class WizardsProvider extends ChangeNotifier {
  List<Wizard> _wizards = [];

  final Wizard _selectedWizards = Wizard(
    elixirs: [],
    id: '',
    firstName: '',
    lastName: '',
  );

  List<Wizard> get wizards => _wizards;

  void getWizard() async {
    _wizards = await fetchWizards();
    notifyListeners();
  }
}
