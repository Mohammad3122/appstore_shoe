import 'package:appstore_shoe/theme/custom_app_theme.dart';
import 'package:appstore_shoe/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomDetailsViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomDetailsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text("Nike", style: AppThemes.detailsAppBar),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppConstantsColor.lightTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
