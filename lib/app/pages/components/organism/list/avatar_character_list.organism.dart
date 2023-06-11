import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/core/config/size/size.config.dart';

import 'package:marvel/app/view_model/cubits/page_cubit.dart';

import 'package:marvel/app/model/character/character_model.dart';

import 'package:marvel/app/pages/components/molecules/card/avatar_card_image.molecule.dart';
import 'package:marvel/app/pages/components/molecules/images/background_character_image.molecule.dart';

class AvatarCharacterListOrganism extends StatelessWidget {
  const AvatarCharacterListOrganism({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageCubit>(
      create: (_) => PageCubit(),
      child: SizedBox(
        height: injector.get<SizeConfig>().sizeV * 100,
        child: BlocBuilder<PageCubit, int>(
          builder: (BuildContext context, int state) {
            return Stack(
              children: [
                BackgroundCharacterImageMolecule(character: characters[state]),
                PageView.builder(
                  onPageChanged: (int page) {
                    context.read<PageCubit>().onPageChanged(page);
                  },
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  controller: PageController(viewportFraction: 0.5),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final s = max(0.7, (1 - (index - state).abs()) + 0.5);
                    return Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: injector.get<SizeConfig>().sizeH * 90 * s,
                        width: injector.get<SizeConfig>().sizeH * 90 * s,
                        child: AvatarCardImageMolecule(
                          height: injector.get<SizeConfig>().sizeH * 90 * s,
                          width: injector.get<SizeConfig>().sizeH * 90 * s,
                          character: characters[index],
                          onTap: (character) {
                            print('chractaer $character');
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
