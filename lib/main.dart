import 'package:any_core/services/cache_manager_service.dart';
import 'package:any_core/services/graphql_service.dart';
import 'package:any_core/services/http_serivce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_discard/themes.dart';
import 'package:get/get.dart';

import 'controllers/screen_controller.dart';

Future<void> main() async {
  await initService();

  runApp(const App());
}

Future<void> initService() async {
  Get.put(HttpService(host: 'https://api.mindpodapp.com'));
  Get.put(GraphQLService());
  Get.put(CacheManagerService());
  await Get.putAsync(
    ScreenController().init,
    permanent: true,
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Any',
      theme: Themes().lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/manager',
      getPages: ScreenController.to.pages,
    );
  }
}
