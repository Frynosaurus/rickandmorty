import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/viewmodels/character_view_model.dart';

class PageMain extends StatefulWidget {
  const PageMain({super.key});

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('text'),
      ),
      body: _buildCharacterList(context),
    );
  }

  Widget _buildCharacterList(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: viewModel.characters[index],
            child: _buildListTile(context),
          );
        },
      ),
    );
  }

  Widget _buildListTile(BuildContext context) {
    return Consumer<Character>(
      builder: (context, character, child) => ListTile(
        title: Text(character.name),
        subtitle: Text(character.species),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character.imageUrl),
        ),
      ),
    );
  }
}
