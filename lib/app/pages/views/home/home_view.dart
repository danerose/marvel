import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/app/injector.dart';
import 'package:marvel/app/repositories/interfaces/marvel_repository.dart';
import 'package:marvel/app/view_model/characters/character_event.dart';
import 'package:marvel/core/extension/localization.extension.dart';

import 'package:marvel/app/view_model/characters/character_state.dart';
import 'package:marvel/app/view_model/characters/character_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appTitle)),
      body: BlocProvider(
        create: (_) => CharacterBloc(
          injector.get<MarvelRepository>(),
        )..add(CharacterLoadList()),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (BuildContext context, CharacterState state) {
            return const Center(
              child: Text('Home'),
            );
          },
        ),
      ),
    );
  }
}
