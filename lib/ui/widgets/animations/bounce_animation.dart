import 'package:flutter/material.dart';

class BounceAnimation extends StatelessWidget {
  const BounceAnimation({
    Key? key,
    required this.child,
    this.begin = 0.4,
    this.end = 1,
    this.intervalStart = 0,
    this.intervalEnd = 1,
    this.duration = const Duration(milliseconds: 750),
  }) : super(key: key);

  final double begin;
  final double end;
  final Duration duration;
  final double intervalStart;
  final double intervalEnd;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      curve: Interval(intervalStart, intervalEnd, curve: ElasticOutCurve(0.85)), // Adjust the parameter for the desired bounce effect
      child: child,
      builder: (BuildContext context, double? value, Widget? child) {
        return Transform.scale(
          scale: value!,
          child: child,
        );
      },
    );
  }
}
