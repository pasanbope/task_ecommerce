import 'package:flutter/material.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  // Dummy list of items in the bag (you would replace this with actual data)
  final List<String> bagItems = [
    'Red T-shirt',
    'Blue Jeans',
    'Black Dress',
    'White Sneakers',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Bag',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black12, // Change the app bar color
        elevation: 0, // Remove the app bar shadow
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // Add padding to the body
        child: ListView.builder(
          itemCount: bagItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0, // Add elevation to the card
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  bagItems[index],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.red, // Customize circle avatar color
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white, // Customize icon color
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
