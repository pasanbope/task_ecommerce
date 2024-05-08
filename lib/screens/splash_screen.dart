import 'package:flutter/material.dart';
import '../common/bottom_navigation.dart';


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
    // Simulate some loading or setup process
    await Future.delayed(Duration(seconds: 3));  // Set the delay as needed
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
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