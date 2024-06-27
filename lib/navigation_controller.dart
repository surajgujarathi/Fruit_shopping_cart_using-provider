import 'package:flutter/widgets.dart';
import 'package:provider_example/productscreen.dart';
import 'package:provider_example/searchproduct.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    Productscreeen(),
    SearchProduct(),

    // Add other screens here
  ];

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Widget> get screens => _screens;
}
