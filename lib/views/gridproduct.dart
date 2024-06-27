import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/cartprovider.dart';
import 'package:provider_example/fruit_data.dart';

class MyCatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Top Items',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: catalog.length,
              itemBuilder: (BuildContext context, int index) {
                final item = catalog[index];
                return Card(
                  elevation: 5,
                  color: Colors.white70,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(item.image),
                      ),
                      Text(
                        item.productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Price: \$${item.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Consumer<CartProvider>(
                        builder: (context, value, child) => cartList
                                .contains(item)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                content: Text(
                                                    '${item.productName} is removed sucessfully')));
                                        // provider.removecartitem(item);
                                        provider.decreaseUnit(item);
                                      },
                                      icon: const Icon(Icons.remove_circle)),
                                  Text(item.units.toString()),
                                  IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                content: Text(
                                                    '${item.productName} is added sucessfully')));
                                        provider.increaseUnit(item);
                                      },
                                      icon: const Icon(Icons.add_circle)),
                                ],
                              )
                            : Container(
                                height: 45,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.redAccent,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration:
                                                Duration(milliseconds: 500),
                                            content: Text(
                                                '${item.productName} is added sucessfully')));
                                    provider.addItem(item);
                                    provider.increaseUnit(item);
                                  },
                                  child: const Text('Add'),
                                ),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
