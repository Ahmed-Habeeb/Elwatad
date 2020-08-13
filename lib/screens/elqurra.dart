import 'package:elwatad/modules/qaremodule.dart';
import 'package:elwatad/player/player.dart';
import 'package:elwatad/screens/quran_screen.dart';
import 'package:elwatad/screens/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Elqurra extends StatefulWidget {
  @override
  _ElqurraState createState() => _ElqurraState();
}

class _ElqurraState extends State<Elqurra> {
  // ignore: non_constant_identifier_names
  List<Qare_module> Qurra=[
    Qare_module("الشيخ مشارى العفاسى",1),
    Qare_module("الشيخ ماهر المعيقلي",2),
    Qare_module("الشيخ أحــمد العجمى",3),
    Qare_module("الشيخ سعد الغامدى",4),
    Qare_module("الشيخ عبدالرحمن السديسى",5),
    Qare_module("الشيخ محــمد جـــبريــل",6),
    Qare_module("الشيخ عبدالــباسط عبدالصمد",7),
    Qare_module("الشيخ محمد صديق المنشاوى",8),
    Qare_module("الشيخ فـــــارس عـــباد",9),
    Qare_module("الشيخ وديــــع اليمني",10),
    Qare_module("الشيخ مـــحمد الطبلاوى",11),
    Qare_module("الشيخ أحــمد الحذيفى",12),
    Qare_module("الشيخ نــاصر القطامي",13),
    Qare_module("الشيخ عبدالله الجهنى",14),
    Qare_module("الشيخ ياسر الدوسري",15),
    Qare_module("الشيخ بندر بليلة",16),
    Qare_module("لشيخ سعود الشريم",17),
    Qare_module("الشيخ إدريس أبكر",18),
    Qare_module("الشيخ محمود خليل الحصري",19),
    Qare_module("الشيخ أحمد خضر الطرابلسي",20),
    Qare_module("الشيخ أبو بكر الشاطري",21),
    Qare_module("لشيخ ياسر القرشي",22),
    Qare_module("الشيخ عبدالله خياط",23),
    Qare_module("الشيخ عادل ريان",24),
    Qare_module("الشيخ أحمد نعينع",25),
    Qare_module("الشيخ محمود علي البنا",26),
    Qare_module("الشيخ هزاع البلوشي",27),
    Qare_module("الشيخ محمد رفعت",28),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(100),
        child:Padding(
          padding: EdgeInsets.only(top: 15),
          child: app(),
        )
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("اخْتَر الصَّوْت الْمُفَضَّل لَك",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w800,wordSpacing: 2,),),
              Expanded(
                child: ListView.builder(itemCount:Qurra.length,itemBuilder: (context, index) {
                  return qura_view(Qurra[index]);

                },),
              ),
              // ignore: missing_return
              Consumer<MyPlayer>(builder: (context, value, child) {
                if(value.sora_module!=null){
                  return SizedBox(height: 60,);
                }
                return SizedBox();

              }, )


            ],
          ),
          Consumer<MyPlayer>(builder: (context, value, child) {
            return MyBottomBar();

          },)
        ],
      )
    );
  }
  app(){
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text("الــقُــرَّاء",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,),),
      ),

      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
  // ignore: non_constant_identifier_names
  qura_view(Qare_module qare){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Quran_screen(qare),));
      },
      child: Card(

        margin: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
        elevation: 10,
        child: Container(
          height: 80,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(qare.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.arrow_back),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
