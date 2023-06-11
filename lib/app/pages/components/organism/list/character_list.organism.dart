import 'package:flutter/material.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/pages/components/molecules/tile/character_tile.molecule.dart';
import 'package:marvel/core/constant/routes.constants.dart';

class CharacterListOrganism extends StatelessWidget {
  const CharacterListOrganism({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: characters.length,
      itemBuilder: (BuildContext _, int i) {
        return CharacterTiledMolecule(
          character: characters[i],
          onPressed: (character) {
            Navigator.pushNamed(context, RoutesConstants.character, arguments: {
              'character': characters[i],
            });
          },
        );
      },
      separatorBuilder: (BuildContext _, int i) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: 0.4,
            color: ColorsConstants.alt,
          ),
        );
      },
    );
  }
}
