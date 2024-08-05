import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget(
      {super.key, required this.size, required this.color, this.child});

  final Size size;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: color,
      child: child,
    );
  }
}
