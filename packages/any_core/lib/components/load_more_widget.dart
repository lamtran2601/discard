import 'dart:math';

import 'package:flutter/material.dart';

class LoadMoreWidget extends StatefulWidget {
  const LoadMoreWidget({
    Key? key,
    this.controller,
    required this.onLoadMore,
    required this.builder,
  }) : super(key: key);

  final Widget Function(ScrollController scrollController) builder;
  final ScrollController? controller;
  final Future<List<dynamic>> Function() onLoadMore;
  @override
  State<LoadMoreWidget> createState() => _LoadMoreWidgetState();
}

class _LoadMoreWidgetState extends State<LoadMoreWidget> {
  late ScrollController _scrollController;

  bool _loading = false;
  bool _end = false;

  @override
  void initState() {
    _scrollController = widget.controller ?? ScrollController();

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
    return widget.builder(_scrollController);
  }
}
