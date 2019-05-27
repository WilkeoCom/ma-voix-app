import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  Topic({
    Key key,
    this.topic,
    this.image,
  }) : super(key: key);

  final String topic;
  final String image;

  @override
  Widget build(BuildContext context) {
    Text topicLabel = Text(
      this.topic,
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.black87,
      ),
    );
    CircleAvatar topicIcon = CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: new NetworkImage(this.image),
    );

    return Chip(
      avatar: topicIcon,
      label: topicLabel,
    );
  }
}
