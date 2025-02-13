import 'dart:async';

import 'package:get/get.dart';

class SuccessController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  void startTime() async {
    var duration = new Duration(milliseconds: 2800);
    Timer(
      duration,
      () => Get.offAllNamed("/home"),
    );
  }
}
