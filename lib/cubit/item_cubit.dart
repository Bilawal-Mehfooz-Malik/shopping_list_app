import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/model/item.dart';
import 'package:shopping_list_app/repository/item_repository.dart';

class ItemCubit extends Cubit<List<Item>> {
  ItemCubit(this._itemsRepository) : super(_itemsRepository.shoppingItems);

  final ItemsRepository _itemsRepository;

  void addItem(Item item) {
    _itemsRepository.add(item);
    _updateList();
  }

  void deleteItem(String id) {
    _itemsRepository.delete(id);
    _updateList();
  }

  void _updateList() {
    emit(List.from(_itemsRepository.shoppingItems));
  }
}
