import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/topic.dart';

class ProjectResume extends StatelessWidget {
  const ProjectResume({super.key, required this.project});

  final Project project;

  Widget getTitle() {
    return Text(
      project.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getSubTitle() {
    return const Text(
      'subtitle',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.black54,
      ),
    );
  }

  Widget getFooter() {
    return Topic(
      topic: project.topics,
      image: project.topicIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTitle(),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        getSubTitle(),
        getFooter(),
      ],
    );
  }
}
