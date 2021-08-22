import 'package:callapi/controller/product_contoller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoemView extends StatelessWidget {
  final ProductControler productControler = Get.put(ProductControler());
  List categories = [
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt",
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTop(),
              _buiderCategotyRow(),
              Expanded(child: Obx(() {
                if (productControler.loading.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (productControler.product.isEmpty) {
                  return Center(
                    child: Text('No Product found'),
                  );
                }
                if (productControler.showGird == true) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: productControler.product.length,
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(productControler
                                        .product[index]['image']),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productControler.product[index]['title'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Expanded(
                                    child: Text(
                                      productControler.product[index]
                                          ['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "\$ ${productControler.product[index]['price']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: productControler.product.length,
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    width: 100,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      productControler.product[index]['image']),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productControler.product[index]['title'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Expanded(
                                  child: Text(
                                    productControler.product[index]
                                        ['description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "\$ ${productControler.product[index]['price']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }))
            ],
          ),
        ));
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cloths',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      productControler.toggleGirl();
                      print(productControler.showGird.value);
                    },
                    icon: Icon(Icons.arrow_downward))
              ],
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
      ],
    );
  }

  Container _buiderCategotyRow() {
    return Container(
      height: 35,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: index == 0 ? Colors.black87 : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            categories[index],
            style: TextStyle(color: index == 0 ? Colors.white : Colors.black87),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: BackButton(),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        'Call Api',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notification_add_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
