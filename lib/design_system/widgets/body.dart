import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 13, bottom: 13),
        color: Theme.of(context).colorScheme.tertiary,
        child: child,
      ),
    );
  }
}
