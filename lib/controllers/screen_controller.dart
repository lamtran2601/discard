import 'package:any_manage/manager/manager_screen.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  static ScreenController get to => Get.find();

  List<GetPage> pages = [
    GetPage(
      name: '/manager',
      page: () => const ManagerScreen(),
    ),
  ];

  Future<ScreenController> init() async {
    final pageData = [
      {
        'name': '/',
      },
    ];
    return this;
  }
}
