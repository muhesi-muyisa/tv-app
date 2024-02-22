import 'package:apisaissai/admin/actions/gestionDon.dart';
import 'package:apisaissai/admin/actions/gestionMembre.dart';
import 'package:apisaissai/admin/addProgramme.dart';
import 'package:apisaissai/home/homePage.dart';
import 'package:flutter/material.dart';

class AddProgramme extends StatefulWidget {
  const AddProgramme({super.key});

  @override
  State<AddProgramme> createState() => _AddProgrammeState();
}

class _AddProgrammeState extends State<AddProgramme> {


   // Les menu d'en bas

  List <BottomNavigationBarItem> _item=[];
  int _id=0;

  void initState(){
    super.initState();
    _item=[];
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white),label: 'Membre'));
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.share,color: Colors.white,),label: 'Souscription'));
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.report,color: Color.fromARGB(255, 54, 54, 54),),label: 'Programme'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Gestion des Programme'),
        actions: [
          IconButton(onPressed: (){
            var route=MaterialPageRoute(builder: ((context) => HomePage()));
                  Navigator.push(context, route);
          }, icon: const Icon(Icons.logout_rounded))
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
          items: _item,
          backgroundColor: Colors.red,
          fixedColor: Colors.red,
          currentIndex: _id,
          onTap: (int item){
            _id=item;
            setState(() {
              if (_id==0) {
                var route=MaterialPageRoute(builder: ((context) => GestionMembre()));
                  Navigator.push(context, route);
                
              }
              if (_id==1) {
                var route=MaterialPageRoute(builder: ((context) => GestionSouscription()));
                  Navigator.push(context, route);
                
              }
              if (_id==2) {
                var route=MaterialPageRoute(builder: ((context) => AddProgramme()));
                  Navigator.push(context, route);
                
              }
            });
          },),
      
    );
  }
}