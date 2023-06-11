import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marvel/app/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel/core/config/size/size.config.dart';

import 'package:marvel/app/view_model/cubits/page_cubit.dart';

import 'package:marvel/core/constant/colors.constants.dart';

class AvatarCharacterLoadingListOrganism extends StatelessWidget {
  const AvatarCharacterLoadingListOrganism({super.key, this.count = 10});

  final int count;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageCubit(),
      child: BlocBuilder<PageCubit, int>(
        builder: (BuildContext context, int state) {
          return SizedBox(
            height: injector.get<SizeConfig>().sizeV * 100,
            child: Stack(
              children: [
                Container(color: ColorsConstants.background),
                PageView.builder(
                  onPageChanged: (int page) {
                    context.read<PageCubit>().onPageChanged(page);
                  },
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  controller: PageController(viewportFraction: 0.5),
                  itemCount: count,
                  itemBuilder: (context, index) {
                    final s = max(0.7, (1 - (index - state).abs()) + 0.5);
                    return Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: injector.get<SizeConfig>().sizeH * 90 * s,
                        width: injector.get<SizeConfig>().sizeH * 90 * s,
                        child: Card(
                          margin: EdgeInsets.all(state == index ? 20 : 0),
                          clipBehavior: Clip.antiAlias,
                          shape: const CircleBorder(),
                          child: Container(
                            width: injector.get<SizeConfig>().sizeH * 90 * s,
                            height: injector.get<SizeConfig>().sizeH * 90 * s,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                injector.get<SizeConfig>().sizeH * 100 * s,
                              ),
                              color: ColorsConstants.grey.withOpacity(0.2),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: injector.get<SizeConfig>().sizeH * 10,
                                height: injector.get<SizeConfig>().sizeH * 10,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
