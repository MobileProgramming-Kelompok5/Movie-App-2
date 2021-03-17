import 'package:flutter/material.dart';
import 'package:movie_app_3/model/movie.dart';
import 'package:movie_app_3/widget/movies_by_genres.dart';
import 'package:movie_app_3/bloc/get_movies_byGenre_bloc.dart';
import 'package:movie_app_3/model/genre.dart';
import 'package:movie_app_3/style/theme.dart' as Style;

class GenresList extends StatefulWidget {
  final List<Genre> genres;
  GenresList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList> {
  final List<Genre> genres;
  _GenresListState(this.genres);
  // TabController _tabController;
  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this, length: genres.length);
    // _tabController.addListener(() {
    //   if (_tabController.indexIsChanging) {
    moviesByGenreBloc..drainStream();
    // }
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    List<Movie> movies;
    return Container(
      height: 307.0,
      child: Scaffold(
        backgroundColor: Style.Colors.mainColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    genres[index].name,
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Raleway'),
                  ),
                  decoration: BoxDecoration(color: Colors.blue),
                );
              }),
        ),
      ),
    );
  }
}

// appBar: PreferredSize(
//   preferredSize: Size.fromHeight(50.0),
//   child: AppBar(
//     backgroundColor: Style.Colors.mainColor,
//     bottom: TabBar(
//       controller: _tabController,
//       indicatorColor: Style.Colors.secondColor,
//       indicatorSize: TabBarIndicatorSize.tab,
//       indicatorWeight: 3.0,
//       unselectedLabelColor: Style.Colors.titleColor,
//       labelColor: Colors.white,
//       isScrollable: true,
//       tabs: genres.map((Genre genre) {
//         return Container(
//             padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
//             child: new Text(genre.name.toUpperCase(),
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.bold,
//                 )));
//       }).toList(),
//     ),
//   ),
// ),
// body: TabBarView(
//   controller: _tabController,
//   physics: NeverScrollableScrollPhysics(),
//   children: genres.map((Genre genre) {
//     return GenreMovies(
//       genreId: genre.id,
//     );
//   }).toList(),
// ),
