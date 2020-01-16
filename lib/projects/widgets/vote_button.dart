import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;

  const VoteButton({Key key, this.icon, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: backgroundColor.withOpacity(0.80),
      textColor: Colors.white,
      child: Icon(icon, color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () {
        print("Voted");
      },
    );
  }
}
