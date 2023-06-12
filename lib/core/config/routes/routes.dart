import 'package:flutter/material.dart';

import 'package:marvel/app/injector.dart';
import 'package:marvel/app/model/character/character_model.dart';
import 'package:marvel/app/pages/views/character/character_view.dart';

import 'package:marvel/core/config/size/size.config.dart';
import 'package:marvel/core/constant/routes.constants.dart';

import 'package:marvel/app/pages/views/home/home_view.dart';
import 'package:marvel/app/pages/views/splash/splash_view.dart';
import 'package:marvel/core/utils/validators.util.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.initial:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.initial),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return const SplashView();
          },
        );
      case RoutesConstants.home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.home),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return const HomeView();
          },
        );
      case RoutesConstants.character:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.character),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return CharacterView(
              character: ValidatorUtils.containsKey(
                settings.arguments as Map<String, dynamic>,
                'character',
                const Character.empty(),
              ),
            );
          },
        );
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (BuildContext _) {
        return const Scaffold(
          body: Center(
            child: Text('Error, Page not found'),
          ),
        );
      },
    );
  }
}
