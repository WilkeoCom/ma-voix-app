import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/chart.dart';
import 'package:ma_voix_app/projects/widgets/project_resume.dart';

class ProjectsListItem extends StatelessWidget {
  ProjectsListItem({
    Key key,
    this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Chart.withSampleData(),
      new ProjectResume(project: project),
    ]);
  }
}
