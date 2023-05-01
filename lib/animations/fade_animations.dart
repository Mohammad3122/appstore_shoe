import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:simple_animations/simple_animations.dart';

enum Aniprops { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<Aniprops>()
      ..add(Aniprops.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
      ..add(Aniprops.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,
          Curves.easeOut);

    return PlayAnimation<MultiTweenValues<Aniprops>>(
      duration: tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(Aniprops.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get(Aniprops.translateY)),
            child: child,
          ),
        );
      },
      tween: tween,
      child: child,
    );
  }
}
