import 'package:flutter/material.dart';
import 'package:marvel/core/extension/localization.extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appTitle)),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
