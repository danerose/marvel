import 'package:flutter/material.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/pages/components/atoms/images/image.atom.dart';

class AvatarCardImageMolecule extends StatelessWidget {
  const AvatarCardImageMolecule({
    super.key,
    this.margin = EdgeInsets.zero,
    required this.height,
    required this.width,
    required this.character,
    required this.onTap,
  });

  final double height;
  final double width;
  final EdgeInsets margin;
  final Character character;
  final Function(Character character) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () => onTap(character),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageAtom(
              url: character.thumbnail.toValidImg(),
              height: height,
              width: width,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(100),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsConstants.black.withOpacity(0.0),
                    ColorsConstants.black.withOpacity(0.0),
                    ColorsConstants.black.withOpacity(0.2),
                    ColorsConstants.black.withOpacity(0.4),
                    ColorsConstants.black,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              child: Text(
                character.name,
                style: const TextStyle(
                  color: ColorsConstants.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
