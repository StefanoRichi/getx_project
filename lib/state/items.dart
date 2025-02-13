import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_project/models/item.dart';

class ItemsController extends GetxController {
  final RxInt cart = RxInt(0);
  final RxDouble total = RxDouble(0.0);
  final RxList<Items> ms_item = <Items>[].obs;
  final RxList<Items> item = <Items>[].obs;
  final RxBool loading = RxBool(false);

  @override
  void onInit() {
    fetchitems();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void fetchitems() async {
    ms_item.clear();
    var data = await rootBundle.loadString("assets/json/data.json");
    var catalogdata = itemsFromJson(data);
    ms_item.addAll(catalogdata);
  }

  void additem(Items val) {
    cart.value++;

    if (item.where((e) => e.id == val.id).isNotEmpty) {
      item.firstWhere((e) => e.id == val.id).qty++;
    } else {
      val.qty = 1;
      item.add(val);
    }
    total.value = total.value + val.price!;
    item.refresh();
  }

  void removeitem(Items val) {
    cart.value--;
    if (item.where((e) => e.id == val.id).isNotEmpty) {
      var result = (item.firstWhere((e) => e.id == val.id).qty--);
      if (result == 1) {
        item.removeWhere((e) => e.id == val.id);
      }
      log(result.toString());
    }
    total.value = total.value - val.price!;
    item.refresh();
  }

  void slide_removeitem(Items val) async {
    var qty = item.firstWhere((e) => e.id == val.id).qty;
    item.removeWhere((e) => e.id == val.id);
    cart.value = cart.value - qty;
    total.value = total.value - (val.price! * qty);
    item.refresh();
  }

  Future<void> checkout() async {
    loading.toggle();
    await Future.delayed(Duration(seconds: 1));
    Get.toNamed("/success");
    loading.toggle();
  }
}
