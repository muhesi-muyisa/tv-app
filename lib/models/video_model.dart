class Video{
  final String? id;
  final String? title;
  final String? thumbnailsUrl;
  final String? channelTitle;
  Video({
    this.id,
    this.title,
    this.channelTitle,
    this.thumbnailsUrl
  });
  factory Video.fromJson(Map<String, dynamic> map){
    return Video(
      id: map['resourceId']['videoId'],
      title: map['title'],
      thumbnailsUrl: map['thumbnails']['high']['url'],
      channelTitle: map['channelTitle']
    );
  }
}



