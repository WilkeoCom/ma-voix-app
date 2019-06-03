import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/widgets/vote_button.dart';

class VoteButtonList extends StatelessWidget {
  const VoteButtonList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forButton = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: new VoteButton(
          icon: Icons.thumb_up,
          backgroundColor: Colors.blue,
        ),
      ),
    );
    var againstButton = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: new VoteButton(
          icon: Icons.thumb_down,
          backgroundColor: Colors.red,
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        forButton,
        againstButton,
      ],
    );
  }
}
