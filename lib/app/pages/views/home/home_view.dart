import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/app/pages/components/organism/list/character_loading_list.organism.dart';
import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/core/extension/localization.extension.dart';

import 'package:marvel/app/view_model/characters/character_state.dart';
import 'package:marvel/app/view_model/characters/character_bloc.dart';
import 'package:marvel/app/view_model/characters/character_event.dart';

import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';

import 'package:marvel/app/pages/components/organism/list/character_list.organism.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: ColorsConstants.white,
        backgroundColor: ColorsConstants.transparent,
        title: Text(context.l10n.appTitle),
      ),
      extendBodyBehindAppBar: true,
      body: BlocProvider<CharacterBloc>(
        create: (_) => CharacterBloc(
          injector.get<MarvelRepository>(),
        )..add(CharacterLoadList()),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (BuildContext context, CharacterState state) {
            switch (state) {
              case CharacterLoadingList():
                return const CharacterLoadingListOrganism();
              case CharacterLoadedList():
                // return const CharacterLoadingListOrganism();
                return CharacterListOrganism(characters: state.characters);
              default:
                return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
