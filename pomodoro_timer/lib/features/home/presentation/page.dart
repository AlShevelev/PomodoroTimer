import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/core/ui_kit/style/colors.dart';
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
        title: Text(AppLocalizations.of(context)!.helloWorld),
        backgroundColor: AppColors.lightBrown,
      ),
      body: CustomPaint(
        painter: PageBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Text(
              //   'You have pushed the button this many times:',
              // ),
            ],
          ),
        ),
      )
    );
  }
}
