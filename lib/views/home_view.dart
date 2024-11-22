import 'package:flutter/material.dart';
import 'package:ma_voix_app/design_system/widgets/body.dart';
import 'package:ma_voix_app/design_system/widgets/bottom_nav_bar.dart';
import 'package:ma_voix_app/projects/widgets/header_app_bar.dart';
import 'package:ma_voix_app/projects/widgets/projects_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeaderAppBar(),
      body: Body(
        child: ProjectsList(),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: 0),
    );
  }
}
