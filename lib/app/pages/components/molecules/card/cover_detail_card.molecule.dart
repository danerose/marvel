import 'package:flutter/material.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/app/pages/components/atoms/images/image.atom.dart';

class CoverDetailMolecule extends StatelessWidget {
  const CoverDetailMolecule({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 200,
      child: Card(
        child: Stack(
          children: [
            ImageAtom(
              url: url,
              width: 120,
              height: 200,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(8),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsConstants.black.withOpacity(0.2),
                    ColorsConstants.black,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    title,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
