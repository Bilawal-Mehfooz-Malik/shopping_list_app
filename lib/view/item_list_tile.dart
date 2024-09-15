import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({super.key, required this.itemName});

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(itemName));
  }
}
