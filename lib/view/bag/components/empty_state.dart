import 'package:appstore_shoe/animations/fade_animations.dart';
import 'package:appstore_shoe/theme/custom_app_theme.dart';
import 'package:flutter/material.dart';

// this will show whenever there is no Shoes added
class EmptyState extends StatefulWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  State<EmptyState> createState() => _EmptyStateState();
}

class _EmptyStateState extends State<EmptyState> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FadeAnimation(
            delay: 0.5,
            child:
                Text("No Shoes Added!", style: AppThemes.bagEmptyListSubTitle),
          ),
          FadeAnimation(
            delay: 0.5,
            child: Text(
              "Once You Added, Come Back!",
              style: AppThemes.bagEmptyListSubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
