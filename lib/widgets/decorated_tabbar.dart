import 'package:flutter/material.dart';

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DecoratedTabBar({Key? key, required this.tabBar, required this.bgcolor})
      : super(key: key);

  final TabBar tabBar;

  final Color bgcolor;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgcolor,
      child: Stack(
        children: [
          tabBar,
        ],
      ),
    );
  }
}
