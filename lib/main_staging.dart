import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:marvel/app/app.dart';
import 'package:marvel/app/injector.dart';
import 'package:marvel/core/enviroment/env.stg.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails errorDetails) {
        log(
          errorDetails.library ?? '',
          name: 'RunZonedGuardedFlutterError',
          error: errorDetails.exception,
          stackTrace: errorDetails.stack,
        );
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        log(
          error.toString(),
          name: 'RunZonedGuardedPlatform',
          error: error,
          stackTrace: stack,
        );
        return true;
      };
      await init(StagingEnv());
      runApp(const App());
    },
    (Object error, StackTrace stack) async {
      log(
        error.toString(),
        name: 'RunZonedGuarded',
        error: error,
        stackTrace: stack,
      );
    },
  );
}
