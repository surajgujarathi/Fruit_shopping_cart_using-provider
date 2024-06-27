import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/cartprovider.dart';
import 'package:provider_example/fruit_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart Screen'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 220, 214, 241),
        ),
        body: cartList.isEmpty
            ? SizedBox(
                height: 500,
                width: 500,
                child: Image.asset('assets/empty.png'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        final cardcomponent = cartList.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child:
                                            Image.asset(cardcomponent.image)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cardcomponent.productName,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '\$ ${(cardcomponent.price * cardcomponent.units).toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    content: Text(
                                                        '${cardcomponent.productName} is removed sucessfully')));
                                            cartProvider
                                                .decreaseUnit(cardcomponent);
                                          },
                                          icon:
                                              const Icon(Icons.remove_circle)),
                                      Text(
                                        cardcomponent.units
                                            .toString(), //  cart number for items
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    content: Text(
                                                        '${cardcomponent.productName} is added sucessfully')));
                                            cartProvider
                                                .increaseUnit(cardcomponent);
                                          },
                                          icon: const Icon(Icons.add_circle)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(10),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.blueGrey),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        onPressed: () {},
                        child: Text(
                          'Pay Now : ${getAmountValue()}',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  String getAmountValue() {
    double totalAmount = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      totalAmount = totalAmount +
          (cartList.elementAt(i).units * cartList.elementAt(i).price);
    }
    // Return value as a String
    return totalAmount.toStringAsFixed(2);
  }
}
