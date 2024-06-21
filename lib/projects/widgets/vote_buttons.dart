import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/votes.dart';
import 'package:ma_voix_app/projects/widgets/vote_button.dart';

class VoteButtons extends StatelessWidget {
  const VoteButtons({super.key, required this.votes});

  final Votes votes;

  @override
  Widget build(BuildContext context) {
    var forButton = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: VoteButton(
            icon: Icons.thumb_up,
            text: "${votes.forPourcentage}%",
            backgroundColor: Theme.of(context).colorScheme.secondary),
      ),
    );
    var abstainButton = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: VoteButton(
          icon: Icons.front_hand,
          text: "${votes.abstainPourcentage}%",
          backgroundColor: Colors.white,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
    var againstButton = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: VoteButton(
            icon: Icons.thumb_down,
            text: "${votes.againstPourcentage}%",
            backgroundColor: Theme.of(context).colorScheme.primary),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        forButton,
        abstainButton,
        againstButton,
      ],
    );
  }
}
