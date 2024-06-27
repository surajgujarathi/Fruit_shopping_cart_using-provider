import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Search product...',
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            // Implement your search logic here
            // You can use a provider to update the product list based on the search query
          },
        ),
      ],
    );
  }
}
