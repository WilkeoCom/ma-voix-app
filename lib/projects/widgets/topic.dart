import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  const Topic({super.key, required this.topic, required this.image});

  final String topic;
  final String image;

  static const Map<String, IconData> iconsMap = {
    'emoji_transportation': Icons.emoji_transportation,
    'family_restroom': Icons.family_restroom,
    'theater_comedy': Icons.theater_comedy,
  };

  @override
  Widget build(BuildContext context) {
    Text topicLabel = Text(
      topic,
      style: TextStyle(
        fontSize: 12.0,
        color: Theme.of(context).primaryColor,
      ),
    );
    Icon topicIcon = Icon(
      iconsMap[image],
      color: Theme.of(context).primaryColor,
      size: 15.0,
    );

    return Chip(
      avatar: topicIcon,
      label: topicLabel,
      side: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
