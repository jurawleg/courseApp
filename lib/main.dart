import 'package:flutter/material.dart';
import './pages/auth.dart';
import 'pages/productCard.dart';
import './pages/productsPage.dart';
import './pages/productsAdminPage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lime,
        accentColor: Colors.deepPurple,
        fontFamily: 'Oswald',
      ),
      home: AuthPage(),
      routes: {
        '/product': (BuildContext context) =>
            ProductsPage(_products, _removeAll), // '/' - for Home page
        '/admin': (BuildContext context) =>
            ProductAdminPage(_addProduct, _delete),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index]['title'],
                  _products[index]['image'],
                  _products[index]['price'],
                  _products[index]['description']));
        }

        return null;
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products, _removeAll));
      },
    );
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _delete(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _removeAll() {
    setState(() {
      _products.clear();
    });
  }
}
