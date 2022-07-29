
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemController extends GetxController{
  List<Item> bag = [];

  List<Item> items = [
    Item(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0KkbIw3XWZex8VQSoS348cICKU7HuSaIPEw&usqp=CAU",
      title: "Keztil Susp.",
      desc: "Cerfuroxime Axetil",
      spec: "Oral Suspension - 125mg",
      amount: "₦385",
    ),
    Item(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0KkbIw3XWZex8VQSoS348cICKU7HuSaIPEw&usqp=CAU",
      title: "Keztil",
      desc: "Cerfuroxime Axetil",
      spec: "Tablet - 250mg",
      amount: "₦1140",
    ),
    Item(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0KkbIw3XWZex8VQSoS348cICKU7HuSaIPEw&usqp=CAU",
      title: "Garlic Oil",
      desc: "Garlic Oil",
      spec: "Soft Gel - 650mg",
      amount: "₦385",
    ),
    Item(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0KkbIw3XWZex8VQSoS348cICKU7HuSaIPEw&usqp=CAU",
      title: "Folic Acid (100)",
      desc: "Folic Acid",
      spec: "Tablet - 5mg",
      amount: "₦70",
    ),
  ];

  List<Item> searchItems({required String itemTitle}){
    List<Item> filteredItems = [];
    filteredItems = items.where((element) => element.title.contains(itemTitle)).toList();
    update();
    return filteredItems;
  }

  void addItemToBag({required Item item, required Function viewBag}){
    bag.add(item);
    showSuccessDialog(itemm: item, viewBag: viewBag);
    update();
  }

  String getBagTotal({required List<Item> bag}){
    num total = 0;
    bag.forEach((element) {
      total += num.parse(element.amount.replaceAll("₦", ""));
    });
    update();
    return "₦${total.toString()}";
  }

  showSuccessDialog({required Function viewBag, required Item itemm}){
    Get.defaultDialog(
      title: "",
      radius: 8,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        child: Stack(
          children: [
            Container(
              width: 200,
              padding: const EdgeInsets.fromLTRB(5,30,5,5),
              child: Column(
                children: [
                  const Text("Successful", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  Text("${itemm.title} has been added to your bag", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: ()=> viewBag.call(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.maxFinite, 45),
                    ),
                    child: const Text("View Bag"),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: ()=> Get.back(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.maxFinite, 45),
                    ),
                    child: const Text("Done"),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

}


class Item{
  final String image;
  final String title;
  final String desc;
  final String spec;
  final String amount;

  Item({required this.image, required this.title, required this.desc, required this.spec, required this.amount});

}