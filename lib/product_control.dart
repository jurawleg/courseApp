import 'package:flutter/material.dart';

class ProductsClear extends StatelessWidget {
  final Function removeProducts;

  ProductsClear(this.removeProducts);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          removeProducts();
        },
        child: Text('Remove all'));
  }
}
