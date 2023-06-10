import 'package:flutter/material.dart';

import 'package:marvel/app/injector.dart';

import 'package:marvel/core/constant/colors.constants.dart';
import 'package:marvel/core/constant/routes.constants.dart';
import 'package:marvel/core/extension/localization.extension.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesConstants.home,
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: injector.get<ColorsConstants>().primary,
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ColorsConstants.black,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  context.l10n.splashScreenForDemostration,
                  style: const TextStyle(
                    color: ColorsConstants.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
