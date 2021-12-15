import 'dart:math';

import 'package:flutter/material.dart';

class LazyListWidget extends StatefulWidget {
  const LazyListWidget({
    Key? key,
    this.scrollController,
    required this.onLoadMore,
    required this.onRefresh,
    required this.builder,
  }) : super(key: key);

  final Widget Function(ScrollController scrollController) builder;
  final ScrollController? scrollController;
  final Future<List<dynamic>> Function() onLoadMore;
  final Future<void> Function() onRefresh;
  @override
  State<LazyListWidget> createState() => _LazyListWidgetState();
}

class _LazyListWidgetState extends State<LazyListWidget> {
  late ScrollController _scrollController;

  bool _loading = false;
  bool _end = false;

  @override
  void initState() {
    _scrollController = widget.scrollController ?? ScrollController();

    _scrollController.addListener(
      () async {
        final position =
            // ignore: invalid_use_of_protected_member
            _scrollController.positions.map((e) => e.extentAfter).reduce(max);
        if (!_loading && !_end && position < 100) {
          _loading = true;
          await widget.onLoadMore().then((res) {
            if (res.isEmpty) {
              _end = true;
            }
            _loading = false;
          });
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: 1,
      onRefresh: () {
        _end = false;
        return widget.onRefresh();
      },
      child: widget.builder(_scrollController),
    );
  }
}
