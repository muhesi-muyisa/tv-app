import 'package:apisaissai/models/video_model.dart';

class Channel{
  final String? id;
  final String? title;
  final String? profilPictureUrl;
  final String? souscriberCount;
  final String? videoCount;
  final String? uploadPlayListId;
   List<Video>? videos;
  Channel({
    this.id,
    this.title,
    this.profilPictureUrl,
    this.souscriberCount,
    this.videoCount,
    this.uploadPlayListId,
    this.videos
  });

  factory Channel.fromJson(Map<String, dynamic> map){
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilPictureUrl: map['snippet']['thumbnails']['default']['url'],
      souscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlayListId:map['contentDetails']['relatedPlaylists']['uploads'] 
    );
  }
}