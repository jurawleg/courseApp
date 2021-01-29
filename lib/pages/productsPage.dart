import 'package:flutter/material.dart';
import 'package:fapp_flutter_course/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function removeAll;

  ProductsPage(this.products, this.removeAll);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text('Easy List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: ProductManager(products, removeAll),
    );
  }
}
