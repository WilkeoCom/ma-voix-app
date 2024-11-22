import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/project_resume.dart';
import 'package:ma_voix_app/projects/widgets/vote_buttons.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  void handleTap(context) => {};

  Widget _getBadge(BuildContext context) {
    return Chip(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      label: const Text("À la Une"),
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      side: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    var projectInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _getBadge(context)),
        Center(
          child: SvgPicture.asset(
            project.image,
            height: 220,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: ProjectResume(project: project),
        ),
      ],
    );

    var projectInfoColumn = GestureDetector(
      onTap: () => handleTap(context),
      child: projectInfo,
    );

    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: projectInfoColumn,
          ),
          VoteButtons(votes: project.votes),
        ],
      ),
    );
  }
}
