import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/arc_banner_image.dart';

class ProjectDetailHeader extends StatelessWidget {
  ProjectDetailHeader(this.project);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage('images/education.jpg'),
        ),
      ],
    );
  }
}
