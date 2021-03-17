import 'package:flutter/material.dart';
import 'package:movie_app_3/widget/now_playing.dart';
import 'package:movie_app_3/widget/top_movie.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:movie_app_3/style/theme.dart' as Style;

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
        child: Stack(
          children: <Widget>[
            FirstContainer(),
            SlidingSheet(
              backdropColor: Style.Colors.thirdColor.withOpacity(0.8),
              elevation: 5,
              cornerRadius: 30,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.6, 1.0],
              ),
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height * 0.2,
                  child: Center(
                    child: TopMovies(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
