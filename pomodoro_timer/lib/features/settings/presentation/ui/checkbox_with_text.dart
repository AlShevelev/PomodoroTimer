import 'package:flutter/material.dart';

import '../../../../core/ui_kit/style/colors.dart';

/// A checkbox with text on the left
class CheckboxWithText extends StatelessWidget {
  const CheckboxWithText({
    required this.text,
    required this.checked,
    required this.onValueChanged,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool checked;

  final Function(bool) onValueChanged;

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
        SizedBox(
          width: 24.0,
          height: 24.0,
          child: Checkbox(
            checkColor: AppColors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: checked,
            onChanged: (bool? value) {
              onValueChanged(value!);
            },
          ),
        )
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    return AppColors.red;
  }
}
