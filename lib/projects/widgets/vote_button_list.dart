import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/widgets/vote_button.dart';

class VoteButtonList extends StatelessWidget {
  final IconData icon;

  const VoteButtonList({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: new VoteButton(
            icon: Icons.thumb_up,
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: new VoteButton(
            icon: Icons.thumb_down,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
