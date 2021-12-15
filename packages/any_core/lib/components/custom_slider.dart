import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dragable_widget.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  final double value;
  final Function(double) onChange;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final width = constraint.maxWidth;

      final double position = min(width - 12, max(0, (width - 6) * value - 6));

      return Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            width: width,
            height: 4,
            decoration: BoxDecoration(
                color: Theme.of(context).unselectedWidgetColor,
                borderRadius: BorderRadius.circular(4)),
          ),
          Container(
            width: position,
            height: 4,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(4)),
          ),
          DragableWidget(
            width: 12,
            onChange: onChange,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: position,
                  height: 24,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: SvgPicture.asset(
                    'assets/icons/slider.svg',
                    width: 12,
                    height: 12,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: position,
                    height: 24,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
