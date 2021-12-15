import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.flexibleSpace,
    this.title,
    this.actions,
    this.onBeforePop,
  }) : super(key: key);

  final Widget? leading;
  final Widget? flexibleSpace;
  final Widget? title;
  final List<Widget>? actions;
  final Function()? onBeforePop;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ??
          (ModalRoute.of(context)?.canPop ?? false
              ? CustomBackButton(onBeforePop: onBeforePop)
              : null),
      elevation: 0.5,
      flexibleSpace: flexibleSpace,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.onBeforePop,
  }) : super(key: key);

  final Function()? onBeforePop;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onBeforePop != null) {
          onBeforePop?.call();
        }
        Navigator.of(context).maybePop();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 24,
          height: 24,
          constraints: const BoxConstraints(
            maxWidth: 24,
            maxHeight: 24,
          ),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
          ),
        ),
      ),
    );
  }
}
