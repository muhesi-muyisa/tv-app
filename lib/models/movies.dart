class MovieModel {
  String? imageAsset;
  String? movieName;
  String? movieRating;
  String? year;
  List <Map>? cast;
  List <Map>? comments;

  // Le constructeur 
  MovieModel({
    this.imageAsset,
    this.movieName,
    this.movieRating,
    this.year,
    this.cast,
    this.comments
  });
}

  //data
 final forYouImages=[
    MovieModel(imageAsset: "images/logo.jpg"),
    MovieModel(imageAsset: "images/logo.jpg"),
    MovieModel(imageAsset: "images/logo.jpg"),
   ];


    final  popularImages=[
    MovieModel(
      imageAsset: "images/logo.jpg",
      movieName: "Muhesi muyisa",
      cast: [
        {
          "name":"Publicité",
          "role":"UAC",
          "image":"images/logo.jpg",
        },
        {
          "name":"Berceau du savoir",
          "role":"Connaissance",
          "image":"images/logo.jpg",
        },
        {
          "name":"Messe en englais",
          "role":"Réligion",
          "image":"images/logo.jpg",
        },
        {
          "name":"Anciens succes",
          "role":"Enanga eya bosokulu",
          "image":"images/logo.jpg",
        },

      ],
      comments: [
        {
          "name":"Moto tv",
          "imageUrl":"images/Moto.PNG",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
        {
          "name":"Moto tv",
          "imageUrl":"images/Moto.PNG",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
        {
          "name":"Moto tv",
          "imageUrl":"images/logo.jpg",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
        {
          "name":"Moto tv",
          "imageUrl":"images/Moto.PNG",
          "date":"Juin 15, 2023",
          "rating":"5.0",
          "comment":"Je suis vraiment fier de cette inovation que nous amène la moto tv, je suis sincèrement reconnessant.",
        },
      ],
      year: "2023",
      movieRating: "8.3"),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Moto Sport",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Religion",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "UAC Culturelle",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Uac.PNG",
        movieName: "Ekir yo Butuku",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Anciens Succes",
        year: "2023",
        movieRating: "6.4",
      ),
   ];

   final legendaryImages=[
    MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Moto Zap",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Yira Lande",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Uac.PNG",
        movieName: "Moto Zik Gospel",
        year: "2023",
        movieRating: "6.4",
      ),
      MovieModel(
        imageAsset: "images/Moto.PNG",
        movieName: "Africa Music",
        year: "2023",
        movieRating: "6.4",
      ),

   ];
   final genresList=[
    MovieModel(movieName: "Muhesi",imageAsset: "images/Moto.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Moto.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Uac.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Moto.PNG"),
    MovieModel(movieName: "Muhesi",imageAsset: "images/Moto.PNG"),
   ];

