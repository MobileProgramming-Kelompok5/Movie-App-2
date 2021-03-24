import 'package:flutter/material.dart';
import 'package:movie_app_3/model/movie_response.dart';
import 'package:movie_app_3/screens/movie_detail_screen/movie_detail_screen.dart';

import '../model/movie.dart';
import '../repository/repository.dart';

class DataSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    return ThemeData(
      primaryColor: Colors.black,
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white70,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  final movieRepo = MovieRepository();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty)
      return Container(
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
      );

    return FutureBuilder<MovieResponse>(
      future: movieRepo.getSearch(query),
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildHomeWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildHomeWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    return SafeArea(
      child: Container(
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
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: FadeInImage(
                  image: movies[index].poster == null
                      ? AssetImage('assets/images/no-image.jpg')
                      : NetworkImage("https://image.tmdb.org/t/p/w200/" +
                          movies[index].poster),
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain),
              title: Text(
                movies[index].title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  height: 2,
                ),
              ),
              subtitle: Text(
                movies[index].overview == ""
                    ? "- There is no overview -"
                    : movies[index].overview,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white60,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailScreen(movie: movies[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
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
      child: Center(
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
      )),
    );
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
  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final suggestedList = (query.isEmpty) ?
  //                         recentMovies :
  //                         movies.where((movie) => movie.toLowerCase().contains(query.toLowerCase())).toList();

  //   return ListView.builder(
  //     itemCount: suggestedList.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(suggestedList[i]),
  //         onTap: () {},
  //       );
  //     },
  //   );
  // }

}
