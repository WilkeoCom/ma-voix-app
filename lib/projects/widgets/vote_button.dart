import 'package:flutter/material.dart';

class VoteButton extends StatefulWidget {
  const VoteButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.backgroundColor,
      this.text = '',
      this.color = Colors.white});

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then the button will be disabled.
  final void Function(String) onPressed;
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final Color color;

  @override
  State<VoteButton> createState() => _VoteButton();
}

class _VoteButton extends State<VoteButton> {
  /*
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const ConfirmationView(
        uniqueKey: "",
        backgroundColor: Colors.green,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.fastEaseInToSlowEaseOut;

        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: curve);

        return ScaleTransition(
          scale: curvedAnimation,
          child: child,
        );
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white));
    String uniqueKey = UniqueKey().toString();

    return Hero(
      tag: uniqueKey,
      createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectCenterArcTween(begin: begin, end: end);
      },
      child: ElevatedButton.icon(
        style: style,
        onPressed: () => widget.onPressed(uniqueKey),
        label: Text(
          widget.text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: widget.color),
        ),
        icon: Icon(widget.icon, color: widget.color),
      ),
    );
  }
}
