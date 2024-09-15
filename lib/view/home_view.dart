import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_list_app/model/item.dart';
import 'package:shopping_list_app/cubit/item_cubit.dart';
import 'package:shopping_list_app/view/items_listview.dart';
import 'package:shopping_list_app/view/message_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: const ItemListView(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  FloatingActionButton _buildFloatingButton() => FloatingActionButton(
        onPressed: _onAdd,
        child: const Icon(Icons.add),
      );

  void _onAdd() {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // [Item Text Field]
                TextField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your items',
                  ),
                ),
                const SizedBox(height: 12),

                // [Save Buttton]
                ElevatedButton(onPressed: _onSave, child: const Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    final itemName = _nameController.text;
    if (itemName.isNotEmpty) {
      final item = Item(id: DateTime.now().toString(), itemName: itemName);
      context.read<ItemCubit>().addItem(item);
      _nameController.clear();
      _pop();
      MessageWidgets(context).showCustomSnack('Item added.');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Empty!'),
          content: const Text('Please enter an item'),
          actions: [TextButton(onPressed: _pop, child: const Text('ok'))],
        ),
      );
    }
  }

  void _pop() => Navigator.of(context).pop();
}
