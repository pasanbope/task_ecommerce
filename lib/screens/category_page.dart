import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/product_service.dart';

class ScrollableListPage extends StatefulWidget {
  const ScrollableListPage({super.key});

  @override
  State<ScrollableListPage> createState() => _ScrollableListPageState();
}

class _ScrollableListPageState extends State<ScrollableListPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductService>(context, listen: false).fetchCategories());
  }


  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final categories = productService.categories;
    final isLoading = productService.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator (valueColor: AlwaysStoppedAnimation<Color>(Colors.red),))
          : Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                print('View All Items button pressed.');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('VIEW ALL ITEMS', style: TextStyle(color: Colors.white),),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]), // Display category name
                  onTap: () {
                    // Action when a category is tapped
                    print('Category ${categories[index]} tapped.');
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


