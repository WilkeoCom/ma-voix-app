import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/widgets/projects_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Les votes en cours')),
        body: ProjectsList());
  }
}
