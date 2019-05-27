import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.blue),
      ),
    );
  }
}
