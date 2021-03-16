import 'package:flutter/material.dart';
import 'package:movie_app_3/widget/now_playing.dart';
import 'package:movie_app_3/widget/top_movie.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xff112339),
              Colors.black,
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            FirstContainer(),
            TopMovies(),
          ],
        ),
      ),
    );
  }
}
