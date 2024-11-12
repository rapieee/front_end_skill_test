import 'package:flutter/material.dart';

class Item {
  final String id;
  String name;

  Item({required this.id, required this.name});
}

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(String name) {
    final newItem = Item(id: DateTime.now().toString(), name: name);
    _items.add(newItem);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void editItem(String id, String newName) {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex != -1) {
      _items[itemIndex].name = newName;
      notifyListeners();
    }
  }
}
