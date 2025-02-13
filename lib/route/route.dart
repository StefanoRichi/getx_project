import 'package:get/get.dart';
import 'package:getx_project/view/cart.dart';
import 'package:getx_project/view/success.dart';

import '../view/home.dart';

class Routers {
  static final router = [
    GetPage(
      name: '/home',
      page: () => const Home(),
    ),
    GetPage(
      name: '/cart',
      page: () => const Carts(),
    ),
    GetPage(
      name: '/success',
      page: () => const Success(),
    ),
  ];
}
