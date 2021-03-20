import 'package:flutter/material.dart';

import 'package:movie_app_3/bloc/get_movie_detail_bloc.dart';
import 'package:movie_app_3/model/movie_detail.dart';
import 'package:movie_app_3/model/movie_detail_response.dart';
import 'package:movie_app_3/style/theme.dart' as Style;

class MovieInfo extends StatefulWidget {
  final int id;
  MovieInfo({Key key, @required this.id}) : super(key: key);
  @override
  _MovieInfoState createState() => _MovieInfoState(id);
}

class _MovieInfoState extends State<MovieInfo> {
  final int id;
  _MovieInfoState(this.id);
  @override
  void initState() {
    super.initState();
    movieDetailBloc..getMovieDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieDetailResponse>(
      stream: movieDetailBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieDetailResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildMovieDetailWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
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

  Widget _buildMovieDetailWidget(MovieDetailResponse data) {
    MovieDetail detail = data.movieDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 50.0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "DURATION",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(detail.runtime.toString() + " min",
                      style: TextStyle(
                          color: Style.Colors.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "RELEASE DATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(detail.releaseDate,
                      style: TextStyle(
                          color: Style.Colors.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0))
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "GENRES",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0),
              ),
              Divider(
                color: Colors.white,
                endIndent: MediaQuery.of(context).size.width * 0.83,
                thickness: 1,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: detail.genres.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Chip(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        label: Text(
                          detail.genres[index].name,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
