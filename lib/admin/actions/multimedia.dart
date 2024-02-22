import 'dart:convert';
import 'package:apisaissai/admin/programmeView.dart';
import 'package:apisaissai/authentification/controls/loading.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Programme extends StatefulWidget {
  const Programme({super.key});

  @override
  State<Programme> createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {

  // Les variables 
  bool loading=true;
  List pdfList=[];

  // instance du menu
  Drawbles menu= Drawbles();


  // récupération 
  Future fetchAllPdf()async{
    final Uri url=Uri.parse("http://g3ig-kmuhesi.uaclab.net/php/getVideos.php");
    final response=await http.get(url);
    if (response.statusCode==200) {
      setState(() {
        pdfList=jsonDecode(response.body);
        loading=false;
      });
      print(pdfList);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllPdf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColorTextTitre,
        title: const Text('Programme'),
        centerTitle: true,
      ),
      body: loading?Loading():Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: pdfList.length,
          itemBuilder: ((context, index) {
            return  ListTile(
              leading: IconButton(onPressed: (){
                var route=MaterialPageRoute(builder: ((context) => ViewProgramme(url: "http://g3ig-kmuhesi.uaclab.net/php/vidoes/"+pdfList[index]['fichier'],designation: pdfList[index]['designation'],)));
                  Navigator.push(context, route);
              }, icon: const Icon(Icons.picture_as_pdf,color: Colors.red,)),
              title: Row(
                children: [
                  Text(pdfList[index]['designation'],style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(pdfList[index]['datePub'],style: TextStyle(color: Colors.white24),),
                ],
              ),
              
            );
            
          })),
      ),
        drawer: menu.drawer(context),);
  }
}