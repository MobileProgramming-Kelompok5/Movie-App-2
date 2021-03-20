import 'package:flutter/material.dart';

import 'package:movie_app_3/bloc/get_movies_bloc.dart';
import 'package:movie_app_3/model/movie.dart';
import 'package:movie_app_3/model/movie_response.dart';
import 'package:movie_app_3/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:movie_app_3/style/theme.dart' as Style;

class TopMovies extends StatefulWidget {
  @override
  _TopMoviesState createState() => _TopMoviesState();
}

class _TopMoviesState extends State<TopMovies> {
  void initState() {
    super.initState();
    moviesBloc..getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Divider(
            color: Style.Colors.thirdColor,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
            thickness: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text(
            "Top Movies",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: 17.0),
          ),
        ),
        Divider(
          color: Colors.black,
          indent: 22,
          endIndent: MediaQuery.of(context).size.width * 0.8,
          thickness: 1,
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<MovieResponse>(
          stream: moviesBloc.subject.stream,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildHomeWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: movies[index].id,
                        child: Container(
                            width: 120.0,
                            height: 190.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(40),
                              ),
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" +
                                          movies[index].poster)),
                            )),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              movies[index].title,
                              maxLines: 3,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Style.Colors.subtitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Chip(
                              backgroundColor: Style.Colors.secondColor,
                              label: Text(
                                'Rating: ' + movies[index].rating.toString(),
                                style: TextStyle(fontFamily: 'Raleway'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              movies[index].overview,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Style.Colors.subtitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway',
                                  fontSize: 11.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
