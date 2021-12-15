import 'dart:math';
import 'package:flutter/material.dart';

class DragableWidget extends StatelessWidget {
  const DragableWidget({
    Key? key,
    required this.child,
    this.onChange,
    this.onChangeCompleted,
    required this.width,
  }) : super(key: key);
  final Widget child;
  final double width;
  final Function(double)? onChange;
  final Function()? onChangeCompleted;

  void handleChanged(double position) {
    onChange?.call(position);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constrains) {
      double getPosition(double dx) =>
          min(1, max(0, dx - (width / 3)) / (constrains.maxWidth - width));

      return GestureDetector(
        onTapDown: (e) {
          handleChanged(getPosition(e.localPosition.dx));
        },
        onTapUp: (e) {
          onChangeCompleted?.call();
        },
        onHorizontalDragUpdate: (e) {
          handleChanged(getPosition(e.localPosition.dx));
        },
        onPanDown: (e) {
          handleChanged(getPosition(e.localPosition.dx));
        },
        onPanStart: (e) {
          handleChanged(getPosition(e.localPosition.dx));
        },
        onPanUpdate: (e) {
          // handleChanged(getPosition(e.localPosition.dx));
        },
        onPanEnd: (e) {
          onChangeCompleted?.call();
        },
        child: child,
      );
    });
  }
}
