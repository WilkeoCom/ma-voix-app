import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/project_detail_header.dart';
import 'package:ma_voix_app/projects/widgets/topic.dart';

class ProjectDetailsPage extends StatelessWidget {
  final int projectId;

  ProjectDetailsPage(this.projectId);

  Widget _buildContentSection() {
    Project project = Project(
      id: 3,
      title: 'projet de loi pour une école de la confiance',
      topics: 'Culture, Éducation, Société',
      image: 'https://static.thenounproject.com/png/552568-200.png',
    );

    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(
            height: 800,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: TextStyle(fontSize: 16.0),
                ),
                Topic(
                  topic: project.topics,
                  image: project.image,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ProjectDetailHeader(null),
          this._buildContentSection(),
        ],
      ),
    );
  }
}
