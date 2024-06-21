import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double radius;

  const Circle({super.key, this.radius = 60});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(Theme.of(context).colorScheme.secondary),
      size: Size(radius, radius),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;

  const CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    canvas.drawCircle(
      Offset(size.width / 1.8, size.height / 3),
      size.width,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
