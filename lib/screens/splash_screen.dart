import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bottom_navigation.dart';
import '../services/product_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _navigateToHome());
  }

  Future<void> _navigateToHome() async {
    await Provider.of<ProductService>(context, listen: false).fetchProducts();
    await Provider.of<ProductService>(context, listen: false).fetchCategories();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
              children: [Image.asset(
                'assets/images/cart.png',
                height: 200,
                width: 200,
              ),]
          ),
          const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
        ],) ,

    ),
    );
  }
}