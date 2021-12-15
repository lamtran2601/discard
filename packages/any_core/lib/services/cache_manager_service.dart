import 'dart:io';

import 'package:any_core/utils/text_utils.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

const String cacheKey = 'global';

class CacheManagerService extends GetxService {
  static CacheManagerService get to => Get.find();

  static CacheManager cache = CacheManager(
    Config(
      cacheKey,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
      repo: JsonCacheInfoRepository(databaseName: cacheKey),
      fileService: HttpFileService(),
    ),
  );

  Future<File> getFile(String url) async {
    printInfo(info: 'getFile: $url');
    final res = await cache.getSingleFile(url);
    return res.copy(
      '${(await getTemporaryDirectory()).path}/${getFileNameFromPath(url)}',
    );
  }
}
