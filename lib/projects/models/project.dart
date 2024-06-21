// Entity
import 'package:ma_voix_app/projects/models/votes.dart';

class Project extends Object {
  final int id;
  final String title;
  final String topics;
  final String topicIcon;
  final String image;
  final Votes votes;

  const Project({
    required this.id,
    required this.title,
    required this.topics,
    required this.topicIcon,
    required this.image,
    required this.votes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || hashCode == other.hashCode;

  @override
  int get hashCode => id;
}
