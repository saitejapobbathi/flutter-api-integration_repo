import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            Icon(Icons.home_max_outlined, size: 100, color: Colors.black),
            SizedBox(height: 20),            
            Text("Welcome to the User Search Tool", style: TextStyle(fontSize: 50),),
            Text("Please wait...", style: TextStyle(fontSize: 20),),            
            SizedBox(height: 15),
            
            //CircularProgressIndicator(),
          ],
        ),
        
      ),
      
    );
  }
}
