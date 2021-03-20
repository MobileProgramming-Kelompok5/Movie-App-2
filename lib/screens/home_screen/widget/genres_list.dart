import 'package:flutter/material.dart';

import 'package:movie_app_3/bloc/get_movies_byGenre_bloc.dart';
import 'package:movie_app_3/model/genre.dart';
import 'package:movie_app_3/screens/home_screen/widget/movies_by_genres.dart';
import 'package:movie_app_3/style/theme.dart' as Style;

class GenresList extends StatefulWidget {
  final List<Genre> genres;
  GenresList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  _GenresListState(this.genres);
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        moviesByGenreBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 307.0,
        child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
            backgroundColor: Style.Colors.firstColor,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Background.png"),
                        fit: BoxFit.cover)),
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: genres.map((Genre genre) {
                    return GenreMovies(
                      genreId: genre.id,
                    );
                  }).toList(),
                )),
            bottomNavigationBar: Container(
              child: TabBar(
                controller: _tabController,
                indicatorColor: Style.Colors.secondColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                unselectedLabelColor: Style.Colors.subtitleColor,
                labelColor: Colors.white,
                isScrollable: true,
                tabs: genres.map((Genre genre) {
                  return Container(
                      padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                      child: Chip(
                        label: Text(genre.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            )),
                      ));
                }).toList(),
              ),
            ),
          ),
        ));
  }
}
