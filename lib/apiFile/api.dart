import 'dart:convert';
import 'dart:io';

import 'package:apisaissai/ApiKey/api_key.dart';
import 'package:apisaissai/models/channel_model.dart';
import 'package:apisaissai/models/video_model.dart';
import 'package:http/http.dart'as http;

class ApiService {
  ApiService.instanciate();
  static ApiService instance = ApiService.instanciate();
  final String _baseUrl='www.googleapis.com';
  String _nextPageToken="";
  Future <Channel> fetchChannel({String? channelId}) async{
    var parameters={
      "part":'snippet, contentDetails, statistics',
      "id":channelId!,
      'key':API_KEY
    };
    var headers={
      HttpHeaders.contentTypeHeader:'application/json'
    };
    Uri uri=Uri.https(_baseUrl,'/youtube/v3/channels',parameters);

    var response= await http.get(uri,headers: headers);
    if (response.statusCode==200) {
      Map<String, dynamic> data=jsonDecode(response.body)['items'][0];
      Channel channel=Channel.fromJson(data);
      channel.videos= await fetchVideo(playListId: channel.uploadPlayListId);
      return channel;
    }
    else{
      var error=json.decode(response.body);
      var errorMessage=error['error']['message'];
      throw errorMessage;
    }

  }
  Future<List<Video>>fetchVideo({String? playListId}) async{
    var parameters={
      "part":'snippet',
      "playlistId":playListId,
      "maxResults":'8',
      "pageToken":_nextPageToken,
      'key':API_KEY
    };
    var headers={
      HttpHeaders.contentTypeHeader:'application/json'
    };
    Uri uri=Uri.https(_baseUrl,'/youtube/v3/playlistItems',parameters);
    var response= await http.get(uri,headers: headers);
    if (response.statusCode==200) {
      var data=json.decode(response.body);
      _nextPageToken=data["nextPageToken"]??'';
      List<dynamic>jsonVideo=data['items'];
      List<Video> videos=[];
      for (var video  in jsonVideo) {
        videos.add(Video.fromJson(video['snippet']));
        
      }
      return videos;
      
    }else{
      var error=json.decode(response.body);
      var errorMessage=error['error']['message'];
      throw errorMessage;
    }
  }

}