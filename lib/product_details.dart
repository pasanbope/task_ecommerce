import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    // final productService = Provider.of<ProductService>(context, listen: false);
    // productService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: SlidingUpPanel(
        minHeight:30, // Adjust this value to move the sliding panel down
        panel: _buildPanel(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${widget.product.price}',
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.product.rating['rate']} / 5',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Select Size',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            children: _buildSizeList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add to cart logic here
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Background color
              onPrimary: Colors.white, // Text color
            ),
            child: const Text('Add to Cart', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSizeList() {
    List<String> sizes = ['S', 'M', 'L', 'XL']; // Example sizes
    return sizes
        .map(
          (size) => ChoiceChip(
        label: Text(
          size,
          style: TextStyle(
            color: selectedSize == size ? Colors.white : Colors.black,
          ),
        ),
        selected: selectedSize == size,
        onSelected: (selected) {
          setState(() {
            selectedSize = size;
          });
        },
        selectedColor: Colors.red,
        backgroundColor: Colors.grey.withOpacity(0.1),
      ),
    )
        .toList();
  }
}
