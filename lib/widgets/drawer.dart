import 'package:apisaissai/admin/programme.dart';
import 'package:apisaissai/authentification/don.dart';
import 'package:apisaissai/authentification/login.dart';
import 'package:apisaissai/authentification/register.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/googleMaps/data.dart';
import 'package:apisaissai/googleMaps/maps.dart';
import 'package:apisaissai/home/homePage.dart';
import 'package:apisaissai/message_push/view/generateNot.dart';
import 'package:apisaissai/screens/youtube.dart';
import 'package:flutter/material.dart';

import '../authentification/models/membreModels.dart';





    // Vérification de la session de l'utilisateur 
  // isconnected()async{
  //    UserModels.getUser();
  //   if (UserModels.sessionUser==null) {
  //     setState(() {
  //       login=false;
  //     });
  //   }else{
  //     setState(() {
  //       login=true;
  //     });
  //   }
  // }





class Drawbles {

  

  Drawer drawer(BuildContext context){


    // Création 
  Future  info() async{
    switch(
      await showDialog(
        context: context, 
        builder: ((context) {
          return  SimpleDialog(
            title: const Text("Avez - vous un compte ?",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            children: [
              SimpleDialogOption(
                child: Text("Se connecter",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                onPressed: (){
                  
                  Navigator.pop(context,reposne.OUI);
                },
              ),
              SimpleDialogOption(
                child: Text("Créer compte membre",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: () {
                  
                  Navigator.pop(context,reposne.NON);
                },
              )
            ],
          );
        }),
        )
    ){
      case reposne.OUI:
                var route=MaterialPageRoute(builder: ((context) => Login()));
                  Navigator.push(context, route);
      break;
      case reposne.NON:
                  var route=MaterialPageRoute(builder: ((context) => Register()));
                  Navigator.push(context, route);
      break;

    }
  }
    

    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              
              accountName: const Text('',),
              accountEmail: const Text("",),
              currentAccountPicture: GestureDetector(
                child:  CircleAvatar(
                  backgroundImage: const AssetImage("images/Uac.PNG"),
                  
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("images/logo.jpg"),fit: BoxFit.fill),
                color: redColorTextTitre),
            ),

            // Body
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => HomePage()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Accueil"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => DataYoutub()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("News"),
                leading: Icon(
                  Icons.tv,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => Programme()));
                  Navigator.push(context, route);
                
              },
              child: const ListTile(
                title: Text("Programme"),
                leading: Icon(
                  Icons.report,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: info,
              child: const ListTile(
                title: Text("Souscription"),
                leading: Icon(
                  Icons.source_sharp,
                  color: Colors.red,
                ),
              ),
            ),

            const Divider(),
            InkWell(
              onTap: (){
                var route=MaterialPageRoute(builder: ((context) => Register()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("créer compte membre"),
                leading: Icon(
                  Icons.create,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => MapSample()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("localisation"),
                leading: Icon(
                  Icons.local_taxi_sharp,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Paramètre"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                 var route=MaterialPageRoute(builder: ((context) => Login()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Se connecter"),
                leading: Icon(
                  Icons.sign_language_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
  }


  Drawer connexion(BuildContext context,String nom, String postnom, String email){
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("",style: TextStyle(fontWeight: FontWeight.bold),),
              accountEmail: Text(email,style: TextStyle(fontWeight: FontWeight.bold)),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/Uac.PNG"),
                ),
              ),
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/logo.jpg"),fit: BoxFit.cover)),
            ),

            // Body
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => HomePage()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Accueil"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => DataYoutub()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("News"),
                leading: Icon(
                  Icons.tv,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => Programme()));
                  Navigator.push(context, route);
                
              },
              child: const ListTile(
                title: Text("Programme"),
                leading: Icon(
                  Icons.report,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => OffreDon()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Souscription"),
                leading: Icon(
                  Icons.source_sharp,
                  color: Colors.red,
                ),
              ),
            ),

            // const Divider(),
            // InkWell(
            //   onTap: () {
            //      var route=MaterialPageRoute(builder: ((context) => Register()));
            //       Navigator.push(context, route);
            //   },
            //   child: const ListTile(
            //     title: Text("créer compte membre"),
            //     leading: Icon(
            //       Icons.create,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),

            InkWell(
              onTap: () {
                var route=MaterialPageRoute(builder: ((context) => MapSample()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("localisation"),
                leading: Icon(
                  Icons.map_outlined,
                  color: Colors.red,
                ),
              ),
            ),
            const Divider(),

            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Paramètre"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                 MembreModels.isDeconnected();
                 var route=MaterialPageRoute(builder: ((context) => HomePage()));
                  Navigator.push(context, route);
              },
              child: const ListTile(
                title: Text("Se déconnecter"),
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
  }
}