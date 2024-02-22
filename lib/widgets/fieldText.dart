import 'package:apisaissai/colors/color.dart';
import 'package:flutter/material.dart';

// Création de la classe de champ de saisie
class CustomFieldeText {
  final String title;
  final String placeholder;
  late String erros;
  final bool isPass;
  late String _value;

  // Constructeur 
  CustomFieldeText({this.title='',this.placeholder='',this.erros='',this.isPass=false});

  // La méthode 
  TextFormField textFormField(){
    return TextFormField(
      obscureText: isPass,
      // Vérification de champs 
      validator: (e) =>e!.isEmpty?erros:null,

      // Récuperation de la valeur entrée dans la zone de texte
      onChanged: (e){
        _value=e;
      },
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: title,
        labelStyle: const TextStyle(color: redColorTextTitre),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))
        )
      ),
    );
  }

  get value{
    return _value;
  } 
  
}