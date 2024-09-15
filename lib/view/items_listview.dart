import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_list_app/model/item.dart';
import 'package:shopping_list_app/cubit/item_cubit.dart';
import 'package:shopping_list_app/view/item_list_tile.dart';
import 'package:shopping_list_app/view/message_widgets.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, List<Item>>(
      builder: (context, items) {
        if (items.isEmpty) {
          return const Center(child: Text('No items found'));
        }

        return ListView.builder(
          itemCount: items.length,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemBuilder: (context, index) {
            final item = items[index];

            return _buildDissmisableTile(item, context);
          },
        );
      },
    );
  }

  Padding _buildDissmisableTile(Item item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Dismissible(
        key: ValueKey(item.id),
        background: Container(color: Colors.red),
        onDismissed: (_) {
          context.read<ItemCubit>().deleteItem(item.id);
          MessageWidgets(context).showCustomSnack('Item deleted.');
        },
        child: ItemListTile(itemName: item.itemName),
      ),
    );
  }
}
