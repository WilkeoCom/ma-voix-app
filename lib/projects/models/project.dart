// Entity
class Project extends Object {
  final int id;
  final String title;
  final String topics;
  final String image;

  const Project({
    this.id,
    this.title,
    this.topics,
    this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || this.hashCode == other.hashCode;

  @override
  int get hashCode => id;
}
