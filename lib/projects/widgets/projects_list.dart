import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/models/votes.dart';
import 'package:ma_voix_app/projects/widgets/project_card.dart';
import 'package:ma_voix_app/projects/widgets/project_small_card.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  final List<Project> projects = const [
    Project(
        id: 3,
        title: 'Projet de loi pour une école de la confiance',
        topics: 'Culture, Éducation, Société',
        topicIcon: 'theater_comedy',
        image: 'assets/images/education.svg',
        votes: Votes(
            forPourcentage: 47.6,
            abstainPourcentage: 13,
            againstPourcentage: 39.4)),
    Project(
        id: 2,
        title: 'Projet de loi d\'orientation des mobilités',
        topics: 'Transports',
        topicIcon: 'emoji_transportation',
        image: 'assets/images/aircraft.svg',
        votes: Votes(
            forPourcentage: 28,
            abstainPourcentage: 22.6,
            againstPourcentage: 49.4)),
    Project(
        id: 5,
        title:
            'Encourager l’usage du contrôle parental sur certains équipements et services vendus en France et permettant d’accéder à Internet',
        topics: 'Famille',
        topicIcon: 'family_restroom',
        image: 'assets/images/family.svg',
        votes: Votes(
            forPourcentage: 89, abstainPourcentage: 1, againstPourcentage: 10)),
  ];

  Widget getListItem(Project project, bool isSpotlightProject) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: isSpotlightProject
          ? ProjectCard(project: project)
          : ProjectSmallCard(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
        shrinkWrap: true,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          bool isSpotlightProject = index == 0;

          return getListItem(project, isSpotlightProject);
        });
  }
}
