 import 'package:audioplayers/audioplayers.dart';
import 'package:elwatad/modules/sora_module.dart';
import 'package:flutter/material.dart';

class MyPlayer with ChangeNotifier{
   AudioPlayer player=AudioPlayer();
   Sora_module sora_module;
   bool isplay = false;
   String current="0:0";
   String time="0:0";





   play(Sora_module sora) async {

     sora_module=sora;
     int result = await player.play(MyPlayer.https_url(sora.link));
     if(result==1) {
       isplay = true;
       curr();
       notifyListeners();

     }


   }
    pause()async{
    var result=await player.pause();
    isplay=!isplay;
    notifyListeners();

   }
    resume()async{
     var result= await player.resume();
     isplay=true;
     notifyListeners();



   }
    stop()async{
     var result=await player.stop();
     isplay=false;
     notifyListeners();
   }
 static https_url(String a){

    String h= a.replaceAll("http", "https");
    print(h);
    return h;
  }
  curr(){
     player.onAudioPositionChanged.listen((Duration duration) {
       current=duration.toString().split(".")[0];
     });
     player.onDurationChanged.listen((Duration duration) {
       time=duration.toString().split(".")[0];

     });
  }
 }
