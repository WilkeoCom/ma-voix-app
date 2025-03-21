import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;
  final Offset? startOffset;
  final Offset? endOffset;

  SlideRoute({
    required this.builder,
    super.fullscreenDialog,
    this.startOffset,
    this.endOffset,
  }) : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (a, b, c) => builder(a),
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: startOffset ?? const Offset(0, 1),
        end: endOffset ?? Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
