import 'package:elwatad/player/player.dart';
import 'package:elwatad/screens/splash_screen.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(){
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (BuildContext context)=>MyPlayer(),)],
      child: MaterialApp(
        title: "الوتد",
        debugShowCheckedModeBanner: false,
        home: Material(
          child: Splash_Screen(),
        ),
      ),
    );
  }
}

