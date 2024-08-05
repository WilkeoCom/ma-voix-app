import 'package:flutter/material.dart';
import 'package:ma_voix_app/views/confirm_view.dart';

class VoteButton extends StatefulWidget {
  const VoteButton(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      this.text = '',
      this.color = Colors.white});

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

  Route _createRoute(String uniqueKey, Color backgroundColor) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => ConfirmationView(
        uniqueKey: uniqueKey,
        backgroundColor: backgroundColor,
      ),
    );
  }

  _goToConfirmationView(
      BuildContext context, String uniqueKey, Color backgroundColor) async {
    return Navigator.of(context).push(_createRoute(uniqueKey, backgroundColor));
  }

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
          onPressed: () {
            _goToConfirmationView(context, uniqueKey, widget.backgroundColor);
          },
          label: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: widget.color),
          ),
          icon: Icon(widget.icon, color: widget.color),
        ));
  }
}
