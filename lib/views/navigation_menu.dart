import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/fruit_data.dart';

import 'package:provider_example/navigation_controller.dart';
import 'package:provider_example/providers/cartprovider.dart';
import 'package:provider_example/views/cartscreeen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NavigationController>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/man.png"),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Suraj",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            Text(
              "Good Morning",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.notifications,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<CartProvider>(
              builder: (context, value, child) => Badge(
                alignment: Alignment.topRight,
                label: Text(cartList.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (index) => CartScreen()));
                    },
                    color: Colors.red,
                    icon: const Icon(Icons.shopping_bag_rounded)),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
              backgroundColor: Colors.white38),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            label: 'Loaction',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile'),
          // Add more items as needed
        ],
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.selectedIndex = index,
      ),
      body: IndexedStack(
        index: controller.selectedIndex,
        children: controller.screens,
      ),
    );
  }
}
