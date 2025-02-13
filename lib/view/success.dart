import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../state/sucess.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessController itemsCon = Get.put(SuccessController());
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          repeat: false,
          frameRate: FrameRate.max,
          "assets/lottie/success.json",
        ),
      ),
    );
  }
}
