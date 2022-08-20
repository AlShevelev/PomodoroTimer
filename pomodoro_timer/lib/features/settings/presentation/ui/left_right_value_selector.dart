import 'package:flutter/material.dart';

import '../../../../core/ui_kit/style/colors.dart';

/// An editor for an integer value via left & right arrows
class LeftRightValueSelector extends StatelessWidget {
  const LeftRightValueSelector({
    required this.text,
    required this.value,
    required this.onValueChanged,
    Key? key,
  }) : super(key: key);

  final String text;
  final int value;

  final Function(int) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.red),
            textAlign: TextAlign.start,
          ),
        ),
        GestureDetector(
          onTap: () {
            onValueChanged(value - 1);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.red,
            ),
          ),
        ),
        Text(
          '$value',
          style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.red),
          textAlign: TextAlign.start,
        ),
        GestureDetector(
          onTap: () {
            onValueChanged(value + 1);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
