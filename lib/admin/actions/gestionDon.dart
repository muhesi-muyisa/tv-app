import 'dart:convert';

import 'package:apisaissai/admin/addProgramme.dart';
import 'package:apisaissai/authentification/controls/loading.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'gestionMembre.dart';

class GestionSouscription extends StatefulWidget {
  const GestionSouscription({super.key});

  @override
  State<GestionSouscription> createState() => _GestionSouscriptionState();
}

class _GestionSouscriptionState extends State<GestionSouscription> {
  // Les menu d'en bas

  List<BottomNavigationBarItem> _item = [];
  int _id = 0;




    // récupération 
    List Showmembre=[];
    bool loading=true;
  Future fetchAllPdf()async{
    final Uri url=Uri.parse("http://g3ig-kmuhesi.uaclab.net/php/getSouscription.php");
    final response=await http.get(url);
    if (response.statusCode==200) {
      setState(() {
        Showmembre=jsonDecode(response.body);
        loading=false;
      });
      print(Showmembre);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllPdf();

     _item = [];
    _item.add(const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Color.fromARGB(255, 54, 54, 54),
        ),
        label: 'Membre'));
    _item.add(const BottomNavigationBarItem(
        icon: Icon(
          Icons.share,
          color: Colors.white,
        ),
        label: 'Souscription'));
    _item.add(const BottomNavigationBarItem(
        icon: Icon(
          Icons.report,
          color: Colors.white,
        ),
        label: 'Programme'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('Gestion des Souscriptions'),
        actions: [
          IconButton(
              onPressed: () {
                var route =
                    MaterialPageRoute(builder: ((context) => HomePage()));
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _item,
        backgroundColor: kBackgroundColor,
        fixedColor: Colors.red,
        currentIndex: _id,
        onTap: (int item) {
          _id = item;
          setState(() {
            if (_id == 0) {
              var route =
                  MaterialPageRoute(builder: ((context) => GestionMembre()));
              Navigator.push(context, route);
            }
            if (_id == 1) {
              var route = MaterialPageRoute(
                  builder: ((context) => GestionSouscription()));
              Navigator.push(context, route);
            }
            if (_id == 2) {
              var route =
                  MaterialPageRoute(builder: ((context) => AddProgramme()));
              Navigator.push(context, route);
            }
          });
        },
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/0.25,
          child: ListView.builder(
            itemCount: Showmembre.length,
            itemBuilder: ((context, index) {
              return DataTable(columns: [
              DataColumn(
                  label: const Text(
                'N°',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
        
              DataColumn(
                  label: const Text(
                'Nom',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
        
              DataColumn(
                  label: const Text(
                'Phone',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: const Text(
                'Motif de sousc',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
        
              DataColumn(
                  label: const Text(
                'Valeur',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: const Text(
                'Date',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
        
              
            ], rows: [
              DataRow(cells: [
                DataCell(Text(index.toString())),
                DataCell(Text(Showmembre[index]['nom'])),
                DataCell(Text(Showmembre[index]['telephone'])),
                DataCell(Text(Showmembre[index]['designation'])),
                DataCell(Text(Showmembre[index]['valeur'])),
                DataCell(Text(Showmembre[index]['dateSouscription'])),
              ]),
        
              
            ]);
            }),
        
            ),
        ),
      ),
    );
  }
}
