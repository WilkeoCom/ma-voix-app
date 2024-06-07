import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
  const VoteButton(
      {super.key, required this.icon, required this.backgroundColor});

  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: backgroundColor.withOpacity(0.80),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white));

    return ElevatedButton(
      style: style,
      onPressed: () {
        print("Voted");
      },
      child: Icon(icon, color: Colors.white),
    );
  }
}
