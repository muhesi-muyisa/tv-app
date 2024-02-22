import 'package:apisaissai/models/movies.dart';
import 'package:apisaissai/screens/detailscreen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  MovieModel movieModel;
  CustomCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => const DeatilsScreen())));},
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: AssetImage(movieModel.imageAsset.toString()),
                    fit: BoxFit.cover)),
                    
          ),
          Positioned(
              left: 15,
              right: 15,
              bottom: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.movieName!,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        movieModel.year!,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.movieRating!,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.star,size: 15,color: Colors.yellow,),
                      const SizedBox(height: 5,),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
