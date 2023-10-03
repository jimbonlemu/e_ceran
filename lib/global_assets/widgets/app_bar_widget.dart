import 'package:flutter/material.dart';

class AppBarFormat extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBarTitle;
  final String styledAppBarTitle;
  final bool? isAppBarCenter;
  final bool? enabledBackButton;

  const AppBarFormat({
    Key? key,
    this.appBarTitle,
    this.styledAppBarTitle = "",
    this.isAppBarCenter = false,
    this.enabledBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: enabledBackButton!,
      leading: enabledBackButton!
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      backgroundColor: Colors.yellow[700],
      shape: ShapeBorder.lerp(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        1,
      ),
      title: appBarTitle ??
          Text(
            styledAppBarTitle,
            style: const TextStyle(
              fontFamily: 'Arimo_bold',
              color: Colors.black,
              letterSpacing: 2.5,
              fontSize: 20,
            ),
          ),
      centerTitle: isAppBarCenter,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
