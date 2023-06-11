import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:skeletons/skeletons.dart';

import 'package:marvel/core/config/size/size.config.dart';
import 'package:marvel/core/constant/colors.constants.dart';

class CharacterLoadingTiledMolecule extends StatelessWidget {
  const CharacterLoadingTiledMolecule({super.key});

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
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: 50,
            height: 50,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      title: SkeletonLine(
        style: SkeletonLineStyle(
          height: 10,
          width: injector.get<SizeConfig>().sizeH * 30,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      subtitle: Row(
        children: [
          SkeletonLine(
            style: SkeletonLineStyle(
              height: 10,
              width: injector.get<SizeConfig>().sizeH * 20,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 10),
          SkeletonLine(
            style: SkeletonLineStyle(
              height: 10,
              width: injector.get<SizeConfig>().sizeH * 20,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        ],
      ),
      trailing: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: ColorsConstants.alt, width: 0.5),
        ),
        height: 25,
        width: 25,
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: 25,
            height: 25,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
