import 'package:flutter/material.dart';
import '../data/Item_Model/ModelClass.dart';
import 'item_detail_screen.dart';

class ItemCard extends StatelessWidget {
  final Products item;

  ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent, // Set card background color to orange
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: ListTile(
        leading: Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(
          item.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // White text for visibility
        ),
        subtitle: Text(
          item.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white70), // Subtitle in lighter white shade
        ),
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
