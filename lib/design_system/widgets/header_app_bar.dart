import 'package:flutter/material.dart';
import 'package:ma_voix_app/design_system/widgets/circle.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({super.key, this.title, this.highlightedTitle = false});

  final String? title;
  final bool highlightedTitle;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    Widget? title;

    if (this.title != null) {
      title = Text(this.title!,
          style: (highlightedTitle && !Navigator.canPop(context)
                  ? Theme.of(context).textTheme.headlineMedium
                  : Theme.of(context).textTheme.headlineSmall)!
              .copyWith(color: Colors.white));
    }

    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: title,
      titleSpacing:
          Navigator.canPop(context) ? 0 : AppBarTheme.of(context).titleSpacing,
      toolbarHeight: 75,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: Container(
        alignment: Alignment.topLeft,
        child: const Circle(radius: 65),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
