// import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:ma_voix_app/config/router.dart' as Router;
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/project_resume.dart';
import 'package:ma_voix_app/projects/widgets/vote_button_list.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  void handleTap(context) => {};
  /*
      Router.Router.router.navigateTo(context, 'project/${project.id}',
          transition: TransitionType.inFromRight);
  */

  @override
  Widget build(BuildContext context) {
    var projectInfo = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 33,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: SvgPicture.asset(
              project.image,
              height: 50,
            ),
          ),
        ),
        Expanded(
          flex: 67,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: ProjectResume(project: project),
          ),
        ),
      ],
    );

    var projectInfoLine = Expanded(
      child: GestureDetector(
        onTap: () => handleTap(context),
        child: projectInfo,
      ),
    );

    var voteButtons = const Expanded(
      //flex: 1,
      child: VoteButtonList(),
    );

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                projectInfoLine,
                //voteButtons,
              ],
            ),
          ),
          //voteButtons,
        ],
      ),
    );
  }
}
