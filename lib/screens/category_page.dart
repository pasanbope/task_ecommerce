import 'package:flutter/material.dart';

class ScrollableListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(width: 200),
          Container(
            width: double.infinity, // Set width to match parent width
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Action for view all items button
                print('View All Items button pressed.');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Set button color to red
              ),
              child: Text('VIEW ALL ITEMS'),
            ),
          ),
          SizedBox(width: 100),
          Expanded(
            child: ListView.builder(
              itemCount: 50, // Example: create a list with 50 items
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'), // Display item index
                  onTap: () {
                    // Action when an item is tapped
                    print('Item $index tapped.');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

