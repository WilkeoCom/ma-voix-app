import 'package:flutter/material.dart';
import 'package:ma_voix_app/design_system/widgets/circle.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Les votes en cours',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white)),
      toolbarHeight: 75,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: Container(
        alignment: Alignment.topLeft,
        child: const Circle(radius: 60),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
