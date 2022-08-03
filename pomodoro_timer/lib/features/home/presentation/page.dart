import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/core/ui_kit/page_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homePageTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings_outlined
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
                Icons.help_outline
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: CustomPaint(
        painter: PageBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Main page',
              ),
            ],
          ),
        ),
      )
    );
  }
}
