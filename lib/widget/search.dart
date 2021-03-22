import 'package:flutter/material.dart';
import 'package:movie_app_3/model/movie_response.dart';
import 'package:movie_app_3/screens/movie_detail_screen/movie_detail_screen.dart';

import '../model/movie.dart';
import '../repository/repository.dart';

class DataSearch extends SearchDelegate {
  // void initState() {
  //   searchBloc..getSearch(query);
  // }
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
    if (query.isEmpty) return Container();

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
    return ListView.builder(
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
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          subtitle: Text(
            movies[index].overview,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: 'Raleway'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: movies[index]),
              ),
            );
          },
        );
      },
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
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
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
