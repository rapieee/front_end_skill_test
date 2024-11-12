import 'package:flutter/foundation.dart';
import '../models/item.dart';
import 'dart:collection';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(String name) {
    final newItem = Item(id: DateTime.now().toString(), name: name);
    _items.add(newItem);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
