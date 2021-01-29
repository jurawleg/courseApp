import 'package:flutter/material.dart';
import './price_tag.dart';
import 'package:fapp_flutter_course/widgets/ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Container(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleDefault(product['title']),
                  SizedBox(
                    width: 8.0,
                  ),
                  PriceTag(product['price'].toString())
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.8),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Text(
                'Union Square, San Francisco',
              )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' + productIndex.toString(),
                ).then((value) => {
                      if (value == true) {print('TRUEEEEEEE!!!!')}
                    }),
              ),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
