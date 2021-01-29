import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('DISCARD')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                  child: Text('DELETE'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Column(
            children: [
              Image.asset(imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Union Square, San Francisco',
                    style: TextStyle(color: Colors.grey, fontFamily: 'Oswald'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '\$' + price.toString(),
                  )
                ],
              ),
              Container(
                child: Text('$description'),
              ),
              Container(
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Delete!'),
                  onPressed: () => _showDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
