
import 'package:flutter/material.dart';

/// An AppBar with a title and a back button only
class AppBarBack extends AppBar {
  AppBarBack({
    Key? key,
    Widget? title,
    VoidCallback? onBackPressed
  }) : super(
    key: key,
    title: title,
      leading: IconButton(
        icon: const Icon(
            Icons.arrow_back_ios_outlined
        ),
        onPressed: onBackPressed
      )
  );
}