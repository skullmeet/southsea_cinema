import 'package:southsea_cinema/models/basketItem.dart';

class BasketRepositary {
  BasketRepositary._internal();

  static final BasketRepositary instance = BasketRepositary._internal();

  final List<BasketItem> _items = [];

  List<BasketItem> getItems() {
    return List<BasketItem>.unmodifiable(_items);
  }

  void addItem(BasketItem item){
    _items.add(item);

  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length){
      _items.remove(index);
    }
  }

  int getTotal() {
    int total = 0 ;
    for (final BasketItem item in _items){
      total += item.quantaty;
    }
    return total;
  }

  double getSubTotal() {
    double sum = 0.0;
    for (final BasketItem item in _items){
      sum += item.lineTotal;
    }
    return sum;
  }

  double getServiceCharge() {
    if (_items.isEmpty){
      return 0.0;
    }
    return 4.0;
  }

  void clearItems() {
      _items.clear();
  }
}