import 'package:flutter/material.dart';

import '../data/Item_Model/ModelClass.dart';

class ItemDetailScreen extends StatelessWidget {
  final Products item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
        elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
              
              onPressed: ()=> Navigator.pop(context)),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {

            },
          ),
        ],
          ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.image, width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(item.title, style: TextStyle(color: Colors.deepOrange,fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}
