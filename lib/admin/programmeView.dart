import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:apisaissai/authentification/controls/loading.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:flutter/material.dart';
class ViewProgramme extends StatefulWidget {

  final String? url;
  final String? designation;
  ViewProgramme({this.url,this.designation});

  @override
  State<ViewProgramme> createState() => _ViewProgrammeState();
}

class _ViewProgrammeState extends State<ViewProgramme> {

  bool loading =true;
  PDFDocument? pdfViewer;

  // Menus 
  Drawbles menu = Drawbles();

  // Load du fichier
   loadProgramme()async{
    pdfViewer=await PDFDocument.fromURL(widget.url!);
    setState(() {
      loading=false;
    });
   }

   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    loadProgramme();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(widget.designation!),
      ),
      body: loading?Loading():Center(
        child: PDFViewer(document: pdfViewer!),
      ),

      drawer: menu.drawer(context),
    );
  }
}