import 'package:elwatad/modules/sora_module.dart';
import 'package:elwatad/player/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Player_screen extends StatefulWidget {
  @override
  _Player_screenState createState() => _Player_screenState();
}


class _Player_screenState extends State<Player_screen> {
String current="0:0";
String time="0:0";

@override
  void initState() {
    // TODO: implement initState
  super.initState();

  MyPlayer.player.onAudioPositionChanged.listen((Duration duration) {
    if(this.mounted){
    setState(() {
      current=duration.toString().split(".")[0];


    });}
  });
    MyPlayer.player.onDurationChanged.listen((Duration duration) {
      if(this.mounted){
      setState(() {
        time=duration.toString().split(".")[0];

      });}

  });
  }
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<MyPlayer>(context);

    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 60,),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      player.sora_module.Sora,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      player.sora_module.Reader_Name,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, MediaQuery.of(context).size.height * .75),
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: (player.isplay)
                          ? Icon(
                              Icons.pause,
                              color: Colors.blue,
                              size: 30,
                            )
                          : Icon(Icons.play_arrow),
                      onPressed: () {
                        if (player.isplay) {
                          player.pause();
                        } else if (!player.isplay) {
                          player.resume();
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.stop,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        player.stop();
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(current+" |  "+time)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// ignore: non_constant_identifier_names

}
