import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:provider_example/navigation_controller.dart';

import 'package:provider_example/views/navigation_menu.dart';

import 'providers/cartprovider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationController(),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation App',
        home: NavigationMenu(),
      ),
    );
  }
}
