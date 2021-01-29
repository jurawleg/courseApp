import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;

  ProductCreate(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreate> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue = 0.0;

  Widget _buildTitleTextField() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Product Name'),
        onChanged: (String value) {
          setState(() {
            titleValue = value;
          });
        });
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String value) {
        setState(() {
          descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Price'),
      onChanged: (String value) {
        setState(() {
          priceValue = double.parse(value);
        });
      },
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
        child: Text('Save'),
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        onPressed: () {
          _submitForm();
        });
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': titleValue,
      'description': descriptionValue,
      'price': priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.popAndPushNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          _buildSaveButton()
        ],
      ),
    );
  }
}
