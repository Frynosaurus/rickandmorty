import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/character_model.dart';

class CharacterViewModel with ChangeNotifier {
  final String _apiUrl = 'https://rickandmortyapi.com/api/character';

  final List<Character> _characters = [];
  List<Character> get characters => _characters;

  CharacterViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });
  }

  void _getCharacters() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> allCharacters = jsonDecode(response.body);
    List<dynamic> results = allCharacters['results'];
    for (Map<String, dynamic> characterMap in results) {
      Character character = Character.fromMap(characterMap);
      _characters.add(character);
    }
    notifyListeners();
  }
}
