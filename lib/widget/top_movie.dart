import 'package:flutter/material.dart';
import 'package:movie_app_3/bloc/get_movies_bloc.dart';
import 'package:movie_app_3/model/movie.dart';
import 'package:movie_app_3/model/movie_response.dart';
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
          padding: const EdgeInsets.only(left: 15.0, top: 20.0),
          child: Text(
            "TOP MOVIES",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: 14.0),
          ),
        ),
        Divider(
          color: Colors.white,
          indent: 16,
          endIndent: MediaQuery.of(context).size.width * 0.84,
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
        height: MediaQuery.of(context).size.height * 0.37 - 5,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
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
                                  color: Style.Colors.titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Chip(
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
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Style.Colors.titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway',
                                  fontSize: 11.0),
                            ),
                            Text("..."),
                            SizedBox(
                              height: 20,
                            ),
                            // RatingBar(
                            //   itemSize: 8.0,
                            //   initialRating: movies[index].rating / 2,
                            //   minRating: 1,
                            //   direction: Axis.horizontal,
                            //   allowHalfRating: true,
                            //   itemCount: 5,
                            //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            //   itemBuilder: (context, _) => Icon(
                            //     EvaIcons.star,
                            //     color: Style.Colors.secondColor,
                            //   ),
                            //   onRatingUpdate: (rating) {
                            //     print(rating);
                            //   },
                            // )
                          ],
                        ),
                      )
                      // Column(
                      //   children: [
                      //     SizedBox(
                      //       height: 10.0,
                      //       width: 200,
                      //     ),
                      //     Container(
                      //       width: 100,
                      //       child: Text(
                      //         movies[index].title,
                      //         maxLines: 2,
                      //         style: TextStyle(
                      //             height: 1.4,
                      //             color: Style.Colors.titleColor,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 15.0),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 5.0,
                      //     ),
                      //     Row(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           movies[index].rating.toString(),
                      //           style: TextStyle(
                      //               color: Style.Colors.titleColor,
                      //               fontSize: 14.0,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         SizedBox(
                      //           width: 5.0,
                      //         ),
                      //         // RatingBar(
                      //         //   itemSize: 8.0,
                      //         //   initialRating: movies[index].rating / 2,
                      //         //   minRating: 1,
                      //         //   direction: Axis.horizontal,
                      //         //   allowHalfRating: true,
                      //         //   itemCount: 5,
                      //         //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      //         //   itemBuilder: (context, _) => Icon(
                      //         //     EvaIcons.star,
                      //         //     color: Style.Colors.secondColor,
                      //         //   ),
                      //         //   onRatingUpdate: (rating) {
                      //         //     print(rating);
                      //         //   },
                      //         // )
                      //       ],
                      //     ),
                      //   ],
                      // )
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
