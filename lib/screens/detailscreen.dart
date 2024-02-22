import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class DeatilsScreen extends StatefulWidget {
  const DeatilsScreen({super.key});

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> {
  List<MovieModel> popularItems=List.of(popularImages);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // back 
          Container(
            foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(colors: [
              kBackgroundColor.withOpacity(0.8),
              Colors.transparent
            ],
            begin:Alignment.bottomCenter,
            end: Alignment.topCenter)),
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(popularItems[0].imageAsset.toString()),fit: BoxFit.contain)
            ),
          ),
          
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildt("Actualités"),
                const SizedBox(width: 5,),
                buildt("Programme",),
                const SizedBox(width: 5,),
                buildt("Souscrire"),
              ],
            ),
          )
        ], 
      )),

    );
  }
  Widget buildt(String title){
    return Container(
      margin: const EdgeInsets.only(top:10),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(18)),
      child: Text(title,style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}