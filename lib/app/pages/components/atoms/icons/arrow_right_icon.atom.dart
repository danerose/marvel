import 'package:flutter/material.dart';
import 'package:marvel/core/constant/colors.constants.dart';

class ArrowRightIconAtom extends StatelessWidget {
  const ArrowRightIconAtom({
    super.key,
    this.size = 30,
    required this.onTap,
  });

  final double size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsConstants.alt, width: 0.5),
            ),
            height: size - 5,
            width: size - 5,
            child: const Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 18,
              color: ColorsConstants.alt,
            ),
          ),
        ),
      ),
    );
  }
}
