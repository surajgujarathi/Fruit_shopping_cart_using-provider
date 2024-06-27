Set<Item> cartList = {};

class Item {
  final String image;
  final double price;
  final String productName;
  int units;

  Item(
      {required this.image,
      required this.price,
      required this.units,
      required this.productName});
}

final List<Item> catalog = [
  Item(
      image: 'assets/banana.png', price: 10.0, productName: 'Banana', units: 0),
  Item(image: 'assets/apple.png', price: 17.2, productName: 'Apple', units: 0),
  Item(
      image: 'assets/dragonfruit.png',
      price: 12.2,
      productName: 'Orange',
      units: 0),
  Item(
      image: 'assets/pineapple.png',
      price: 10.2,
      productName: 'Pineapple',
      units: 0),
];
