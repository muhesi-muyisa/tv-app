import 'dart:convert';

import 'package:http/http.dart'as http;

import '../authentification/controls/encrypt.dart';
class Api{
  static addSouscription(Map data) async{
    final response= await http.post(Url.addSouscription,body: {
      "data":encrypt(jsonEncode(data))
    });

    if (response.statusCode==200) {
      var result=jsonDecode(decrypt(response.body));
      if(result[0]==true) {
        return result;
      }
      else {
        return null;
      }

    }else {
      return null;
  }


  // Methode 
  

  // L'appli api
  
}
  static getPost() async{
    final response=await http.get(Url.getSouscription);
    if (response.statusCode==200) {
      return jsonDecode(decrypt(response.body));
    }else{
      return null;
    }
  }

}


class Url{ 
    static Uri addSouscription=Uri.parse("http://g3ig-kmuhesi.uaclab.net/php/souscription.php");
    static Uri getSouscription=Uri.parse("http://g3ig-kmuhesi.uaclab.net/php/getMembre.php");
  }