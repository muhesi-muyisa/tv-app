import 'dart:async';

import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Drawbles menu= Drawbles();
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate( 
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),)
        ..loadRequest(Uri.parse('https://www.google.com/maps/place/Radio+Moto+Butembo-Beni/@0.1401285,29.2862396,21z/data=!4m6!3m5!1s0x176031ce5b2da0d7:0xc9da48e4fe4aba!8m2!3d0.140097!4d29.2863321!16s%2Fg%2F11h0yk4tt?entry=ttu'));
  }

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      body: WebViewWidget(controller: controller),
      drawer: menu.drawer(context),

      // Scrolll....................
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}