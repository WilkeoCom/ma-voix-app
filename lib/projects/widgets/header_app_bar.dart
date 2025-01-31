import 'package:flutter/material.dart';
import 'package:ma_voix_app/design_system/widgets/circle.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({super.key, this.title});

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    Widget? title;
    if (this.title != null) {
      title = Text(this.title!,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white));
    }

    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: title,
      toolbarHeight: 75,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: Container(
        alignment: Alignment.topLeft,
        child: const Circle(radius: 60),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
