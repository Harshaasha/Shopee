import 'package:flutter/material.dart';
import '../data/Item_Model/ModelClass.dart';
import 'Item_detail_screen.dart';

class ItemCard extends StatelessWidget {
  final Products item;

  ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(item.title),
        subtitle: Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemDetailScreen(item: item)),
          );
        },
      ),
    );
  }
}
