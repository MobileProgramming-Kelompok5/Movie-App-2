import 'package:flutter/material.dart';
import 'package:movie_app_3/model/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.movies,
  }) : super(key: key);

  final Movie movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
              // shape: ,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w200/" + movies.poster),
              ),
            )),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  movies.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Chip(
                label: Text(
                  'Rating: ' + movies.rating.toString(),
                  style: TextStyle(
                      fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
