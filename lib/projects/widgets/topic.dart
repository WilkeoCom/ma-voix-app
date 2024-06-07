import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  const Topic({super.key, required this.topic, required this.image});

  final String topic;
  final String image;

  static const Map<String, IconData> iconsMap = {
    'theater_comedy': Icons.theater_comedy,
    'emoji_transportation': Icons.emoji_transportation,
  };

  @override
  Widget build(BuildContext context) {
    Text topicLabel = Text(
      topic,
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.black87,
      ),
    );
    Icon topicIcon = Icon(
      iconsMap[image],
      color: Colors.black87,
      size: 15.0,
    );

    return Chip(
      avatar: topicIcon,
      label: topicLabel,
    );
  }
}
