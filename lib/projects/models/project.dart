// Entity
class Project extends Object {
  final int id;
  final String title;
  final String topics;
  final String topicIcon;
  final String image;

  const Project({
    required this.id,
    required this.title,
    required this.topics,
    required this.topicIcon,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || hashCode == other.hashCode;

  @override
  int get hashCode => id;
}
