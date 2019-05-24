import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';

class ProjectsList extends StatelessWidget {
  final List<Project> projects = [
    new Project(
        id: 3,
        title: 'projet de loi pour une école de la confiance',
        topics: 'Culture, Éducation, Société',
        image: 'https://static.thenounproject.com/png/552568-200.png'),
    new Project(
        id: 2,
        title: 'projet de loi d\'orientation des mobilités',
        topics: 'Transports',
        image: 'https://img.icons8.com/metro/420/ground-transportation.png')
  ];

  Widget buildProjectItem(BuildContext context, int index) {
    Project project = projects[index];

    return new ListTile(
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(project.image),
        ),
      ),
      title: new Text(project.title),
      subtitle: new Text(project.topics),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: projects.length,
      itemBuilder: buildProjectItem,
    );
  }
}
