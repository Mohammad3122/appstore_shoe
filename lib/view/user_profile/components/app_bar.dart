import 'package:appstore_shoe/theme/custom_app_theme.dart';
import 'package:appstore_shoe/utils/constants.dart';
import 'package:flutter/material.dart';

class UserViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "My Profile",
          style: AppThemes.profileAppBarTitle,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 8.0, right: 5),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
