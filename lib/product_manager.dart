import 'package:flutter/material.dart';
import 'package:fapp_flutter_course/product_control.dart';
import 'widgets/products/products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function removeAll;

  ProductManager(this.products, this.removeAll);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [ProductsClear(removeAll)]),
      Expanded(child: Products(products))
    ]);
  }
}
