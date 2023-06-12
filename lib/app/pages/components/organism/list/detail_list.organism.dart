import 'package:flutter/material.dart';

import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';

import 'package:marvel/app/pages/components/molecules/card/cover_detail_card.molecule.dart';

class DetailListOrganism<T> extends StatelessWidget {
  const DetailListOrganism({super.key, required this.list});

  final List<T> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext _, int index) {
          switch (T) {
            case SerieDetail:
              return Padding(
                padding: const EdgeInsets.only(left: 2),
                child: CoverDetailMolecule(
                  title: (list[index] as SerieDetail).title,
                  url: (list[index] as SerieDetail).thumbnail.toValidImg(),
                ),
              );
            case EventDetail:
              return Padding(
                padding: const EdgeInsets.only(left: 2),
                child: CoverDetailMolecule(
                  title: (list[index] as EventDetail).title,
                  url: (list[index] as EventDetail).thumbnail.toValidImg(),
                ),
              );
            default:
              return Padding(
                padding: const EdgeInsets.only(left: 2),
                child: CoverDetailMolecule(
                  title: (list[index] as ComicDetail).title,
                  url: (list[index] as ComicDetail).thumbnail.toValidImg(),
                ),
              );
          }
        },
      ),
    );
  }
}
