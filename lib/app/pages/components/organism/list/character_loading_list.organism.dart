import 'package:flutter/material.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/app/pages/components/molecules/tile/character_loading_tile.molecule.dart';

class CharacterLoadingListOrganism extends StatelessWidget {
  const CharacterLoadingListOrganism({
    super.key,
    this.count = 15,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
      itemBuilder: (BuildContext _, int i) {
        return const CharacterLoadingTiledMolecule();
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
