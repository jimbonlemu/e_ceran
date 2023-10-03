import 'package:flutter/material.dart';

class AppBarFormat extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBarTitle;
  final String styledAppBarTitle;
  final bool? isAppBarCenter;

  const AppBarFormat({
    Key? key,
    this.appBarTitle,
    this.styledAppBarTitle = "",
    this.isAppBarCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appBarTitle ?? Text(styledAppBarTitle),
      centerTitle: isAppBarCenter,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
