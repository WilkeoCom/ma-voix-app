import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/project_detail_header.dart';

class ProjectDetailsPage extends StatelessWidget {
  final int projectId;

  ProjectDetailsPage(this.projectId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProjectDetailHeader(null),
            Text('Project details'),
          ],
        ),
      ),
    );
  }
}
