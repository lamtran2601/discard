import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
    this.onReload,
  }) : super(key: key);
  final Function(int index)? onReload;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomBottomNavigationBar(
        currentIndex: 0,
        items: const [
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
          ),
        ],
        onChange: (int index) async {
          if (Get.global(index).currentState?.canPop() ?? false) {
            Get.until((route) => route.isFirst, id: index);
          } else {
            onReload?.call(index);
          }
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onChange,
  }) : super(key: key);
  final int currentIndex;
  final List<CustomBottomNavigationBarItem> items;
  final Function(int value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...items.asMap().entries.map<Widget>((item) {
            final isActive = item.key == currentIndex;
            return Expanded(
              child: IconButton(
                color:
                    isActive ? Theme.of(context).toggleableActiveColor : null,
                onPressed: () => onChange(item.key),
                icon: isActive && item.value.activeIcon != null
                    ? item.value.activeIcon!
                    : item.value.icon,
              ),
            );
          })
        ],
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  const CustomBottomNavigationBarItem({
    required this.icon,
    this.activeIcon,
  });
  final Widget icon;
  final Widget? activeIcon;
}
