import 'package:flutter/material.dart';
import 'package:marvel/app/pages/components/molecules/card/cover_detail_loading_card.molecule.dart';

class DetailLoadingListOrganism extends StatelessWidget {
  const DetailLoadingListOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext _, int index) {
          return const Padding(
            padding: EdgeInsets.only(left: 2),
            child: CoverDetailLoadingMolecule(),
          );
        },
      ),
    );
  }
}
