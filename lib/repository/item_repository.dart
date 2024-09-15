import 'package:shopping_list_app/model/item.dart';

class ItemsRepository {
  final List<Item> _shoppingItems = [];

  List<Item> get shoppingItems => _shoppingItems;

  void add(Item item) {
    shoppingItems.add(item);
  }

  void delete(String id) {
    shoppingItems.removeWhere((item) => item.id == id);
  }
}
