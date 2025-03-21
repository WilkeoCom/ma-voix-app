import 'package:flutter/material.dart';
import 'package:ma_voix_app/design_system/widgets/body.dart';
import 'package:ma_voix_app/design_system/widgets/bottom_nav_bar.dart';
import 'package:ma_voix_app/design_system/widgets/header_app_bar.dart';
import 'package:ma_voix_app/projects/widgets/projects_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderAppBar(
        title: 'Les votes en cours',
        highlightedTitle: true,
      ),
      body: Body(
        child: ProjectsList(),
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: 0),
    );
  }
}
