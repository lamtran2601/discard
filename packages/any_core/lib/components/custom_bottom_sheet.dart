import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.child,
    this.height,
  }) : super(key: key);
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: child,
    );
  }
}

class CustomDraggableBottomSheet extends StatelessWidget {
  const CustomDraggableBottomSheet({
    Key? key,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1,
    required this.builder,
  }) : super(key: key);

  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Widget Function(BuildContext, ScrollController) builder;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      expand: false,
      builder: (context, controller) => CustomBottomSheet(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            Expanded(
              child: builder(context, controller),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomPopup extends StatelessWidget {
  const CustomBottomPopup({Key? key, required this.items}) : super(key: key);
  final List<CustomPopupItem> items;
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      height: (items.length + 1) * 60,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children:
              [...items, CustomPopupItem(text: 'Cancel', onPressed: () {})]
                  .map(
                    (e) => TextButton(
                      onPressed: () {
                        e.onPressed();
                        Get.back();
                      },
                      child: Center(
                        child: Text(e.text),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}

class CustomPopupItem {
  CustomPopupItem({required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;
}
