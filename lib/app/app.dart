import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:marvel/core/config/routes/routes.dart';
import 'package:marvel/core/config/theme/theme.dart';
import 'package:marvel/core/constant/routes.constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      initialRoute: RoutesConstants.initial,
      themeMode: ThemeMode.dark,
      theme: CustomTheme.light(),
      darkTheme: CustomTheme.dark(),
      locale: PlatformDispatcher.instance.locale,
      onGenerateRoute: RouteGenerator.generateRoutes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
