import 'package:elwatad/player/player.dart';
import 'package:elwatad/screens/elqurra.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Start_elqurra_screen();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/logo.jpg")),
            ),
          ),
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Start_elqurra_screen(){
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Elqurra(),));
    });
  }
}
