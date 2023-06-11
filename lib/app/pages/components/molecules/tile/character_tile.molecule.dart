import 'package:flutter/material.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/pages/components/atoms/images/image.atom.dart';

class CharacterTiledMolecule extends StatelessWidget {
  const CharacterTiledMolecule({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorsConstants.alt, width: 0.5),
        ),
        height: 50,
        width: 50,
        child: ImageAtom(
          url: character.thumbnail.toValidImg(),
          height: 50,
          width: 50,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      title: Text(
        character.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Row(
        children: [
          Text(
            '${character.comic.available.toString()} Comics',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorsConstants.grey,
                ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                color: ColorsConstants.grey,
                borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(width: 10),
          Text(
            '${character.storie.available.toString()} Stories',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorsConstants.grey,
                ),
          ),
        ],
      ),
      trailing: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {},
        child: Container(
          // padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: ColorsConstants.alt, width: 0.5),
          ),
          height: 25,
          width: 25,
          child: const Icon(Icons.keyboard_arrow_right_outlined, size: 18),
        ),
      ),
    );
  }
}
