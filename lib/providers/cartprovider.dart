import 'package:flutter/material.dart';
import 'package:provider_example/fruit_data.dart';

class CartProvider extends ChangeNotifier {
  void addItem(Item item) {
    cartList.add(item);
    notifyListeners();
  }

  void removecartitem(Item item) {
    cartList.remove(item);
    notifyListeners();
  }

  ///  Increase Method
  void increaseUnit(Item item) {
    /// Increasing the Unit by 1
    item.units = item.units + 1;

    /// Adding item to  CartList
    cartList.add(item);

    /// Notifying its listeners
    notifyListeners();
  }

////////////////////////////////////////////////////
  /// Decrease Method
  void decreaseUnit(Item item) {
    /// Decreasing the Unit by 1
    item.units = item.units - 1;

    /// Checking the condition whether the Unit Decreasing reached to zero
    if (item.units <= 0) {
      /// If True we are remove that item from addToCartList
      cartList.remove(item);
    } else {
      /// if false we are again adding item to addToCartList
      cartList.add(item);
    }

    /// Notifying its listeners
    notifyListeners();
  }
}
