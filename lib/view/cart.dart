import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state/items.dart';

class Carts extends StatelessWidget {
  const Carts({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsController itemsCon = Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.only(top: 60, left: 10, right: 10),
          itemCount: itemsCon.item.length,
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete),
            ),
            onDismissed: (direction) =>
                itemsCon.slide_removeitem(itemsCon.item[index]),
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.asset(
                    itemsCon.item[index].image.toString(),
                  ),
                ),
                title: Text(itemsCon.item[index].name.toString()),
                subtitle: Text(itemsCon.item[index].price.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        itemsCon.additem(itemsCon.item[index]);
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                    Text(itemsCon.item[index].qty.toString()),
                    IconButton(
                      onPressed: () {
                        itemsCon.removeitem(itemsCon.item[index]);
                      },
                      icon: Icon(
                        Icons.remove,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 100),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              itemsCon.checkout();
            },
            child: itemsCon.loading == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("฿${itemsCon.total}",
                          style: TextStyle(fontSize: 18)),
                      Text(
                        "Checkout",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
