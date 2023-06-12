import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel/app/injector.dart';
import 'package:marvel/core/config/size/size.config.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/core/extension/localization.extension.dart';

import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/model/details/comic_detail_model.dart';
import 'package:marvel/app/model/details/event_detail_model.dart';
import 'package:marvel/app/model/details/serie_detail_model.dart';

import 'package:marvel/app/view_model/details/character_detail_bloc.dart';
import 'package:marvel/app/view_model/details/character_detail_event.dart';
import 'package:marvel/app/view_model/details/character_detail_state.dart';

import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';

import 'package:marvel/app/pages/components/atoms/images/image.atom.dart';
import 'package:marvel/app/pages/components/atoms/icons/arrow_left_icon.atom.dart';

import 'package:marvel/app/pages/components/organism/list/detail_list.organism.dart';
import 'package:marvel/app/pages/components/organism/list/detail_loading_list.organism.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorsConstants.transparent,
        leading: ArrowLeftIconAtom(onTap: () => Navigator.pop(context)),
        title: Text(character.name),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              ImageAtom(
                url: character.thumbnail.toValidImg(),
                width: injector.get<SizeConfig>().sizeH * 100,
                height: injector.get<SizeConfig>().sizeV * 100,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.zero,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorsConstants.black.withOpacity(0.5),
                      ColorsConstants.black,
                    ],
                  ),
                ),
              )
            ],
          ),
          ListView(
            children: [
              Center(
                child: Hero(
                  tag: character.name,
                  child: ImageAtom(
                    url: character.thumbnail.toValidImg(),
                    width: injector.get<SizeConfig>().sizeH * 60,
                    height: injector.get<SizeConfig>().sizeH * 60,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              BlocBuilder<CharDetailBloc, CharDetailState>(
                bloc: CharDetailBloc(injector.get<MarvelRepository>())
                  ..add(CharacterComicsDetailLoad(character: character)),
                buildWhen: (p, c) => p.loadingComics != c.loadingComics,
                builder: (BuildContext _, CharDetailState state) {
                  return Visibility(
                    visible: state.comics.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(context.l10n.comics),
                        ),
                        Visibility(
                          visible: state.loadingComics,
                          replacement: DetailListOrganism<ComicDetail>(
                            list: state.comics,
                          ),
                          child: const DetailLoadingListOrganism(),
                        )
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<CharDetailBloc, CharDetailState>(
                bloc: CharDetailBloc(injector.get<MarvelRepository>())
                  ..add(CharacterSeriesDetailLoad(character: character)),
                buildWhen: (p, c) => p.loadingSeries != c.loadingSeries,
                builder: (BuildContext _, CharDetailState state) {
                  return Visibility(
                    visible: state.series.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(context.l10n.series),
                        ),
                        Visibility(
                          visible: state.loadingComics,
                          replacement: DetailListOrganism<SerieDetail>(
                            list: state.series,
                          ),
                          child: const DetailLoadingListOrganism(),
                        )
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<CharDetailBloc, CharDetailState>(
                bloc: CharDetailBloc(injector.get<MarvelRepository>())
                  ..add(CharacterEventsDetailLoad(character: character)),
                buildWhen: (p, c) => p.loadingEvents != c.loadingEvents,
                builder: (BuildContext _, CharDetailState state) {
                  return Visibility(
                    visible: state.events.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(context.l10n.events),
                        ),
                        Visibility(
                          visible: state.loadingEvents,
                          replacement: DetailListOrganism<EventDetail>(
                            list: state.events,
                          ),
                          child: const DetailLoadingListOrganism(),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
