import 'package:flutter/material.dart';

class SliverPersistentHeaderDelegateWidget
    extends SliverPersistentHeaderDelegate {
  SliverPersistentHeaderDelegateWidget(
      {required this.minHeight, this.maxHeight, required this.child});

  final double minHeight;
  final double? maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => minHeight;

  @override
  double get minExtent => maxHeight ?? minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
