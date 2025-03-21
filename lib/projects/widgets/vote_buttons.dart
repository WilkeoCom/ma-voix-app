import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/votes.dart';
import 'package:ma_voix_app/projects/widgets/vote_button.dart';

import '../screens/confirm_screen.dart';

class VoteButtons extends StatefulWidget {
  final Votes votes;

  const VoteButtons({super.key, required this.votes});

  @override
  State<VoteButtons> createState() => _VoteButtonsState();
}

class _VoteButtonsState extends State<VoteButtons> {
  double _forPourcentage = 0;
  double _abstainPourcentage = 0;
  double _againstPourcentage = 0;

  @override
  void initState() {
    super.initState();
    _forPourcentage = widget.votes.forPourcentage;
    _abstainPourcentage = widget.votes.abstainPourcentage;
    _againstPourcentage = widget.votes.againstPourcentage;
  }

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
    var forButton = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: VoteButton(
            icon: Icons.thumb_up,
            text: "${_forPourcentage.toStringAsFixed(1)}%",
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: (uniqueKey) {
              widget.votes.addFor();
              setState(() {
                _forPourcentage = widget.votes.forPourcentage;
                _abstainPourcentage = widget.votes.abstainPourcentage;
                _againstPourcentage = widget.votes.againstPourcentage;
              });
              _goToConfirmationView(
                  context, uniqueKey, Theme.of(context).colorScheme.secondary);
            }),
      ),
    );
    var abstainButton = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: VoteButton(
            icon: Icons.front_hand,
            text: "${_abstainPourcentage.toStringAsFixed(1)}%",
            backgroundColor: Colors.white,
            color: Theme.of(context).colorScheme.primary,
            onPressed: (uniqueKey) {
              widget.votes.addAbstain();
              setState(() {
                _forPourcentage = widget.votes.forPourcentage;
                _abstainPourcentage = widget.votes.abstainPourcentage;
                _againstPourcentage = widget.votes.againstPourcentage;
              });
              _goToConfirmationView(
                  context, uniqueKey, Theme.of(context).colorScheme.primary);
            }),
      ),
    );
    var againstButton = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: VoteButton(
          icon: Icons.thumb_down,
          text: "${_againstPourcentage.toStringAsFixed(1)}%",
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: (uniqueKey) {
            widget.votes.addAgainst();
            setState(() {
              _forPourcentage = widget.votes.forPourcentage;
              _abstainPourcentage = widget.votes.abstainPourcentage;
              _againstPourcentage = widget.votes.againstPourcentage;
            });
            _goToConfirmationView(
                context, uniqueKey, Theme.of(context).colorScheme.primary);
          },
        ),
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
