import 'package:apisaissai/apiFile/api.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/models/channel_model.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:flutter/material.dart';
class YouTubeHome extends StatefulWidget {
  const YouTubeHome({super.key});

  @override
  State<YouTubeHome> createState() => _YouTubeHomeState();
}

class _YouTubeHomeState extends State<YouTubeHome> {
  Drawbles menu= Drawbles();
     Channel? _channel;
     //MotoTv:  UCZSpiym20H7UtybU6GUVIA
     //%a chaine: UCpxAN_MF3CwzuK5l44Wy-TQ

   getChannel() async{
    Channel channel= await ApiService.instance.fetchChannel(channelId: 'UCBVjMGOIkavEAhyqpxJ73Dw');
    setState(() {
      _channel!=channel;
    });
    
  }
  @override
  void initState(){
    super.initState();
    getChannel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColorTextTitre,
        title: const Text("En direct"),
        centerTitle: true,
      ),
      body:_channel==null?Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor
          ),
        ),
      ):Column(
        children: [
          Card(
            child: Container(
              height: 100,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                     backgroundImage: NetworkImage(_channel!.profilPictureUrl!),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                         Text(_channel!.title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: redColorTextTitre),),
                        Text(_channel!.souscriberCount!,style: const TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        //   ListView.builder(
        //     shrinkWrap: true,
        // itemBuilder:((context, i){
        //   return null;
        // }))
        ],
      ),
      drawer: menu.drawer(context),
    );
  }
}

class LancerMultimedia extends StatelessWidget {
  const LancerMultimedia({super.key});

  @override
  Widget build(BuildContext context) {
    return YouTubeHome();
  }
}