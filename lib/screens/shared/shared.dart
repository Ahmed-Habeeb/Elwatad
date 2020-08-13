import 'package:elwatad/player/player.dart';
import 'package:elwatad/screens/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomBar extends StatefulWidget {
  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

}
  @override
  Widget build(BuildContext context) {
  final player=Provider.of<MyPlayer>(context);
    return  Positioned(
      height: 60,bottom: 0,
      left: 0,
      right: 0,
      child:(player.sora_module==null)?Container(): GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Player_screen(),));
        },
        child: Container(

          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text(player.sora_module.Reader_Name,style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              Text(player.sora_module.Sora,style: TextStyle(color: Colors.white,fontSize: 22),),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  icon:(player.isplay)? Icon(
                    Icons.pause ,
                    color: Colors.white,
                    size: 30,
                  ):Icon(Icons.play_circle_filled, color: Colors.white,
                    size: 30,),
                  onPressed: () {
                    if(player.isplay){
                      player.pause();

                    }
                    else if(!player.isplay){
                      player.resume();

                    }


                  },
                ),
              ),


            ],
          ),
        ),
      ),);
  }
}
