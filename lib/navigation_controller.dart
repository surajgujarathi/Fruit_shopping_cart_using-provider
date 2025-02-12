import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider_example/views/productscreen.dart';
import 'package:provider_example/views/searchproduct.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const Productscreeen(),
    const SearchProduct(),
    const MyLocationsScreen(),
    const ProfileScreen()

    // Add other screens here
  ];

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Widget> get screens => _screens;
}

class MyLocationsScreen extends StatelessWidget {
  const MyLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Comming Scoon.....'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Comming Scoon.....'),
      ),
    );
  }
}
