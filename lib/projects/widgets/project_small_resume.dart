import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/topic.dart';

class ProjectSmallResume extends StatelessWidget {
  const ProjectSmallResume({super.key, required this.project});

  final Project project;

  Widget getTitle(BuildContext context) {
    return Text(
      project.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget getSubTitle(BuildContext context) {
    return Text(
      'subtitle',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall,
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
        getTitle(context),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        getSubTitle(context),
        getFooter(),
      ],
    );
  }
}
