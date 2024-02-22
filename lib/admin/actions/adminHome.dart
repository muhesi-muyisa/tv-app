import 'package:apisaissai/admin/actions/gestionDon.dart';
import 'package:apisaissai/admin/actions/gestionMembre.dart';
import 'package:apisaissai/admin/addProgramme.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:flutter/material.dart';
class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {

  // Les menu d'en bas

  List <BottomNavigationBarItem> _item=[];
  int _id=0;

  void initState(){
    super.initState();
    _item=[];
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,),label: 'Membre'));
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.share,color: Colors.white,),label: 'Souscription'));
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.report,color: Colors.white,),label: 'programme'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,

      ),
      body: Center(
        child: Container()
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _item,
          backgroundColor: kBackgroundColor,
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