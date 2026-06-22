import 'package:flutter/material.dart';

class CustomAnimationText extends StatelessWidget {
  final Widget child;
  final int index;
  final Offset beginOffset;
  final int baseDuration;
  final int staggerDelay;
  final Curve curve;

  const CustomAnimationText({
    super.key,
    required this.child,
    required this.index,
    this.beginOffset = const Offset(-5, 0),
    this.baseDuration = 800,
    this.staggerDelay = 80,
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: beginOffset, end: Offset.zero),
      duration: Duration(milliseconds: baseDuration + (index * staggerDelay)),
      curve: curve,
      builder: (context, offset, child) {
        return FractionalTranslation(translation: offset, child: child);
      },
      child: child,
    );
  }
}
