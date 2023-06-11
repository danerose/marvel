import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/pages/components/atoms/images/image.atom.dart';
import 'package:marvel/core/config/size/size.config.dart';
import 'package:marvel/core/constant/colors.constants.dart';

class BackgroundCharacterImageMolecule extends StatelessWidget {
  const BackgroundCharacterImageMolecule({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageAtom(
          url: character.thumbnail.toValidImg(),
          height: injector.get<SizeConfig>().sizeV * 100,
          width: injector.get<SizeConfig>().sizeH * 100,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.zero,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorsConstants.black.withOpacity(0.6),
                ColorsConstants.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
