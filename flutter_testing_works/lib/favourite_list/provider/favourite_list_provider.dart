import 'package:flutter/cupertino.dart';

class Favourite extends ChangeNotifier {
  List<int> _favouriteList = [];

  List<int> get favouriteItems => _favouriteList;

  void add(int itemIndex) {
    _favouriteList.add(itemIndex);
    notifyListeners();
  }

  void remove(int item) {
    _favouriteList.remove(item);
    notifyListeners();
  }
}
