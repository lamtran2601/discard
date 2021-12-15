import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    this.radius = 24,
    this.url = '',
    this.path = '',
  }) : super(key: key);

  final String url;
  final String path;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: ClipOval(
          child: url.isEmpty
              ? SvgPicture.asset(
                  'assets/icons/avatar.svg',
                )
              : path.isNotEmpty
                  ? Image.file(
                      File(path),
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                    ),
        ),
      ),
    );
  }
}
