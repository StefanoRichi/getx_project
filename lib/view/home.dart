import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/state/items.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsController itemsCon = Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("TakeIT Shopping"),
          centerTitle: true,
          actions: [
            Obx(() => IconButton(
                  onPressed: () {
                    Get.toNamed("/cart");
                  },
                  icon: Badge.count(
                    count: itemsCon.cart.value,
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ))
          ],
        ),
        body: Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: itemsCon.ms_item.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) => Card(
              elevation: 3,
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      itemsCon.ms_item[index].image.toString(),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Text(
                        itemsCon.ms_item[index].name.toString(),
                        overflow: TextOverflow.ellipsis,
                      )),
                  Flexible(
                      flex: 1,
                      child: Text(itemsCon.ms_item[index].price.toString())),
                  ElevatedButton(
                      onPressed: () {
                        itemsCon.additem(itemsCon.ms_item[index]);
                      },
                      child: Text("Add"))
                ],
              ),
            ),
          ),
        ));
  }
}
