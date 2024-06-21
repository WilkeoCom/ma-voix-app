import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white));

    return ElevatedButton.icon(
      style: style,
      onPressed: () {
        print("Voted");
      },
      label: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
      ),
      icon: Icon(icon, color: color),
    );
  }
}
