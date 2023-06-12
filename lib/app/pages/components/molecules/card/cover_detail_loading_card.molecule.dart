import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CoverDetailLoadingMolecule extends StatelessWidget {
  const CoverDetailLoadingMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SkeletonAvatar(
        style: SkeletonAvatarStyle(
          width: 120,
          height: 200,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
