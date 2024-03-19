import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HeaderAppBar(
      {super.key, required this.title, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
        icon: const _BorderIcon(
          child: FaIcon(FontAwesomeIcons.bars),
        ),
      ),
      title: title,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const _BorderIcon(
                  child: FaIcon(FontAwesomeIcons.bagShopping),
                )))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BorderIcon extends StatelessWidget {
  final Widget child;
  const _BorderIcon({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.grey[350]!)),
        child: child);
  }
}
