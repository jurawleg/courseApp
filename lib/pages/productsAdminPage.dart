import 'package:flutter/material.dart';
import './product_create.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductAdminPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
                child: Column(
              children: <Widget>[
                AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('All products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              ],
            )),
            appBar: AppBar(
              title: Text('Manage a Product'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.create), text: "Create Product"),
                  Tab(icon: Icon(Icons.list), text: "My Products")
                ],
              ),
            ),
            body: TabBarView(
              children: [ProductCreate(addProduct), ProductList()],
            )));
  }
}