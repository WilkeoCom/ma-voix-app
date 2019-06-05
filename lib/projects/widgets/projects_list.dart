import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/projects_list_item.dart';

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

  Widget getListItem(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 200,
        child: new ProjectsListItem(project: project),
      ),
    );

    /*
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
    */
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.all(10.0),
      children:
          projects.map<Widget>((project) => getListItem(project)).toList(),
    );
  }
}
