import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/widgets/vote_button.dart';

class VoteButtonList extends StatelessWidget {
  const VoteButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    var forButton = const Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: VoteButton(
          icon: Icons.thumb_up,
          backgroundColor: Colors.blue,
        ),
      ),
    );
    var againstButton = const Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: VoteButton(
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
