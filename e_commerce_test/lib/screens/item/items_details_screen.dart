
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_theme.dart';
import '../../controllers/products_controller/item_controller.dart';

class ItemsDetailsScreen extends GetView<ItemController> {
  final Item item;
  const ItemsDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(builder: (ctrl){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            GestureDetector(
              onTap: ()=> showBag(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                    const SizedBox(width: 5,),
                    Text("${controller.bag.length}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 120, width: 100,
                        child: Image.network(item.image, fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(item.title, style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 4,),
                    Text(item.spec, style: TextStyle(),),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sold by".toUpperCase(), style: TextStyle(color: Colors.blue),),
                            const SizedBox(width: 4,),
                            Text("Emzor Pharmaceuticals", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Row(
                            children: [
                              Text("-", style: TextStyle(color: Colors.grey, fontSize: 30),),
                              const SizedBox(width: 10,),
                              Text("1", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                              const SizedBox(width: 10,),
                              Text("+", style: TextStyle(color: Colors.grey, fontSize: 25),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Text("Pack(s)", style: TextStyle(color: Colors.grey),),
                        const Spacer(),
                        Wrap(
                          children: [
                            Text("₦", style: TextStyle(color: Colors.black, fontSize: 15,
                                fontWeight: FontWeight.bold),),
                            Text("${item.amount.replaceAll("₦", "")}", style: TextStyle(color: Colors.black, fontSize: 20,
                                fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Text("Product details".toUpperCase(),
                      style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.format_size_sharp, color: kPrimaryColor,),
                              const SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pack size".toUpperCase(), style: TextStyle(color: Colors.blue),),
                                  const SizedBox(width: 4,),
                                  Text("3x10", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.settings_overscan_rounded, color: kPrimaryColor,),
                              const SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Product id".toUpperCase(), style: TextStyle(color: Colors.blue),),
                                  const SizedBox(width: 4,),
                                  Text("GDHGSYY76738", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.medical_services_outlined, color: kPrimaryColor,),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Constituents".toUpperCase(), style: TextStyle(color: Colors.blue),),
                            const SizedBox(width: 4,),
                            Text(item.desc, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.transfer_within_a_station_sharp, color: kPrimaryColor,),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dispensed in".toUpperCase(), style: TextStyle(color: Colors.blue),),
                            const SizedBox(width: 4,),
                            Text("Packs", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Text("1 pack of ${item.title} contains 3 unit(s) of tablet(s)",
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                  elevation: 0,
                  minimumSize: Size(Get.width, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                    const SizedBox(width: 5,),
                    Text("Add to bag"),
                  ],
                ),
                onPressed: ()=> controller.addItemToBag(item: item, viewBag: (){
                  Get.back();
                  showBag();
                }),
              ),
            ),
          ],
        ),
      );
    });
  }

  showBag(){
    Get.bottomSheet(
      FractionallySizedBox(
        heightFactor: 0.95,
        child: Container(
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
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Text("Tap on an item for add, remove and delete options", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...controller.bag.map((e){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Container(
                                  height: 40, width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(e.image),
                                        fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text("1x".toUpperCase(), style: TextStyle(color: Colors.white),),
                                      const SizedBox(width: 6,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${e.title}".toUpperCase(), style: TextStyle(color: Colors.white),),
                                          const SizedBox(width: 4,),
                                          Text("${e.spec}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Text(e.amount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    Text("${controller.getBagTotal(bag: controller.bag)}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                    elevation: 0,
                    minimumSize: Size(Get.width, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text("Checkout"),
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true
    );
  }
}
