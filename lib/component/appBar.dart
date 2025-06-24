import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  final String text;
   MyAppbar({super.key,
     required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(text),
    );
  }
}
