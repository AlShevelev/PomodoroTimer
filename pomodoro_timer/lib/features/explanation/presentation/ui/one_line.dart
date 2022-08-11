import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core/ui_kit/style/colors.dart';

class OneLine extends StatelessWidget {
  const OneLine({
    required this.text,
    required this.topPadding,
    required this.bottomPadding,
    Key? key,
  }) : super(key: key);

  final String text;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
        left: 10.0,
        right: 10.0,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2!.apply(color: AppColors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}
