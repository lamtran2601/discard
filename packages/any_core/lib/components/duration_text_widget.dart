import 'package:flutter/material.dart';

class DurationTextWidget extends StatelessWidget {
  const DurationTextWidget({
    Key? key,
    required this.duration,
    this.style,
  }) : super(key: key);
  final Duration duration;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          duration.inHours > 0
              ? '${duration.inHours.toString().padLeft(2, '0')}:'
              : '',
          style: style,
        ),
        Text(
          duration.toString().split('.').first.substring(2),
          style: style,
        ),
      ],
    );
  }
}
