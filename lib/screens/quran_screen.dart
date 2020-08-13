import 'package:elwatad/api_request/sora_api.dart';
import 'package:elwatad/modules/qaremodule.dart';
import 'package:elwatad/modules/sora_module.dart';
import 'package:elwatad/player/player.dart';
import 'package:elwatad/screens/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class Quran_screen extends StatefulWidget {
  Qare_module qare_module;

  Quran_screen(this.qare_module);

  @override
  _Quran_screenState createState() => _Quran_screenState(qare_module);
}

// ignore: camel_case_types
class _Quran_screenState extends State<Quran_screen> {
  Qare_module qare;

  _Quran_screenState(this.qare);
  Sora_Api api=Sora_Api();
  bool issearch=false;
  List<Sora_module> searchlist=List<Sora_module>();
  var list;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
 final player=Provider.of<MyPlayer>(context,listen: false);
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170),
        child: Container(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    qare.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  automaticallyImplyLeading: false,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextField(
                          onChanged: (text){
                            setState(() {
                              if(text.isNotEmpty) {
                                issearch=true;
                                searchlist=search(list, text);

                              }
                              else{
                                issearch=false;
                              }
                            });
                          },
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              hintText: "بحث عن السوره",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 17,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body:Stack(children: <Widget>[
        FutureBuilder(
          future:api.fetch_sora_byid(qare.num) ,
          // ignore: missing_return
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState==ConnectionState.none){
              return Container(
                child: Center(child: Text("برجاء التاكد من الاتصال بالانترنت "),),
              );
            }
            else if(snapshot.connectionState==ConnectionState.active){
              return Container(
                child: Center(child: Text("جاري التحميل ..."),),

              );
            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return Container(
                child: Center(child: Text("جاري التحميل..."),),

              );
            }

            else if (snapshot.connectionState==ConnectionState.done){
              if(snapshot.data!=null){
                List<Sora_module> data =snapshot.data;

                list=data;
                List<Sora_module> data1=(issearch)?searchlist:data;

                return  Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: ListView.builder(padding: EdgeInsets.only(top: 20),itemCount: data1.length,
                          itemBuilder: (context, index) {


                            return  GestureDetector(
                              onTap: (){
                                player.play(data1[index]);
                              },
                              child: sora_view(data1[index]),
                            );
                          },
                        ),
                      ),
                    ),
                    Consumer<MyPlayer>(builder: (context, value, child) {
                      if(value.sora_module!=null){
                        return SizedBox(height: 60,);
                      }
                      return SizedBox();

                    }, )
                  ],
                );
              }
              else{
                return Container(
                  child: Center(child: Text("هناك خطأ ما برجاء المحاوله في وقت لاحق"),),
                );
              }


            }


          },
        ),
        Consumer<MyPlayer>(builder: (context, value, child) {
         return MyBottomBar();

        },)

      ],)
    );
  }
  sora_view(Sora_module sora){
    return Card(
      margin: EdgeInsets.only( left: 15, right: 15, bottom: 10),
      elevation: 10,
      child: Container(
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "-" + sora.Sora_Number,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blue),
                      ),
                    ),
                    Text(
                      sora.Sora,
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.blue),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,top: 8,bottom: 8),
                  child: Text("عدد أياتها: "+sora.Ayats_number,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w800),),
                )
              ],
            ),
            Column(children: <Widget>[

              Card(
                  elevation: 10,
                  borderOnForeground: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.play_circle_filled,size: 40,color: Colors.blue,))
            ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[

                  Text(sora.Sora_Type,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w800),),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 5),
                    child: Text("رقم الصفحه : "+sora.pageNumber,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w800),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  search(List<Sora_module>list, String search ){
    List<Sora_module> searchlist1=List<Sora_module>();

    for(var sora in list){
      if(sora.Sora.contains(search)){
        searchlist1.add(sora);
      }

    }
    return searchlist1;
  }
}
