import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  // Dummy list of favorite items (you would replace this with actual data)
  final List<String> favoriteItems = [
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
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black12,// Change the app bar color
        elevation: 0, // Remove the app bar shadow
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // Add padding to the body
        child: ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0, // Add elevation to the card
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  favoriteItems[index],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.red, // Customize circle avatar color
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white, // Customize icon color
                  ),
                ),
                // You can add more details or actions here, like removing from favorites
                // trailing: IconButton(
                //   icon: Icon(Icons.favorite),
                //   onPressed: () {
                //     // Remove item from favorites
                //   },
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}
