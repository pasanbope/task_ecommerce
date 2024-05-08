import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import the FlutterRatingBar widget
import '../services/product_service.dart';
import '../product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductService>(context).products;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 400.0,
            stretch: true,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/images/banner_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fashion Sale',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality for the button
                        },
                        child: Text('Shop Now'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Rounded corners
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'All Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var product = products[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductDetailScreen(product)),
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)), // Top rounded corners
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: product.rating['rate'].toDouble(), // Convert int to double
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  // Update the rating
                                },
                              ),

                              SizedBox(height: 4),

                              Text(
                                product.category,
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),

                              SizedBox(height: 4),

                              Text(
                                product.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(height: 4),




                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
