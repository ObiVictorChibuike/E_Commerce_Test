
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_theme.dart';
import '../../controllers/products_controller/item_controller.dart';
import 'items_details_screen.dart';

class ItemsScreen extends GetView<ItemController> {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${controller.items.length} item(s)", style: const TextStyle(color: Colors.black),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40, width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_upward_sharp, size: 18,),
                      Icon(Icons.arrow_downward_sharp, size: 18,),
                    ],
                  ),
                ),
                Container(
                  height: 40, width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Center(child: Icon(Icons.filter_list_alt, size: 18,)),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Center(child: Icon(Icons.search, size: 18,)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.68,
              ),
              itemCount: controller.items.length,
              itemBuilder: (context, index){
                return ItemCard(
                  image: controller.items[index].image,
                  title: controller.items[index].title,
                  desc: controller.items[index].desc,
                  spec: controller.items[index].spec,
                  amount: controller.items[index].amount,
                  onTap: ()=> Get.to(()=> ItemsDetailsScreen(item: controller.items[index],)),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15,10,15,15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
              color: kPrimaryColor,
            ),
            child: Column(
              children: [
                Container(
                  width: 50, height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                    const SizedBox(width: 10,),
                    Text("Bag", style: TextStyle(color: Colors.white),),
                    const Spacer(),
                    Container(
                      width: 50, height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(child: Text("${controller.bag.length}", style: TextStyle(fontWeight: FontWeight.bold,
                          color: kPrimaryColor, fontSize: 20),)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}

class ItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final String spec;
  final String amount;
  final VoidCallback onTap;
  const ItemCard({Key? key, required this.image, required this.title,
    required this.desc, required this.spec, required this.amount, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 100, width: 80,
                  child: Image.network(image, fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(height: 10,),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 4,),
              Text(desc, style: TextStyle(fontSize: 10),),
              const SizedBox(height: 4,),
              Text(spec, style: TextStyle(fontSize:9),),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  child: Text(amount, style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

