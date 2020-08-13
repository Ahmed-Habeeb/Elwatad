import 'dart:convert';

import 'package:elwatad/modules/sora_module.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Sora_Api{
  // ignore: non_constant_identifier_names
  String bas_url="https://gad25.xyz/Quran/QuranShared.php";

  // ignore: non_constant_identifier_names
  Future<List<Sora_module>>fetch_sora_byid(int id)async{
    List<Sora_module> soar=List<Sora_module>();
    var res= await http.post(bas_url,body: {"reader_id":id.toString()},headers:  {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
    },);
    if(res.statusCode==200){
      var result=json.decode(res.body);
      for(var sora in result){
        soar.add(Sora_module(sora["reader_id"],sora["Sora"],sora["link"],sora["Reader_Name"],sora["pageNumber"],sora["Sora_Type"],
        sora["Sora_Number"],sora["Ayats_number"]));

      }
    }
    return soar;

  }

}
