import 'package:appstore_shoe/theme/custom_app_theme.dart';
import 'package:appstore_shoe/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(top: 6.0),
        child: Text(
          "Discover",
          style: AppThemes.homeAppBar,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            // .. do something
          },
          icon: const Icon(
            CupertinoIcons.search,
            size: 25.0,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        IconButton(
          onPressed: () {
            // .. do something
          },
          icon: const Icon(
            CupertinoIcons.bell,
            size: 25.0,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
