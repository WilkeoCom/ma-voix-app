import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/widgets/projects_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Les votes en cours')),
        body: const ProjectsList());
  }
}
