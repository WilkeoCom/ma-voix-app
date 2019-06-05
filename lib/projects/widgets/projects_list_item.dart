import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/chart.dart';
import 'package:ma_voix_app/projects/widgets/project_resume.dart';
import 'package:ma_voix_app/projects/widgets/vote_button_list.dart';

class ProjectsListItem extends StatelessWidget {
  ProjectsListItem({
    Key key,
    this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    var projectInfo = Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Chart.withSampleData(),
          new ProjectResume(project: project),
        ],
      ),
    );
    var voteButtons = Expanded(
      flex: 1,
      child: new VoteButtonList(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        projectInfo,
        voteButtons,
      ],
    );
  }
}
