import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:movie_app_3/bloc/get_movie_videos_bloc.dart';
import 'package:movie_app_3/model/movie.dart';
import 'package:movie_app_3/model/video.dart';
import 'package:movie_app_3/model/video_response.dart';
import 'package:movie_app_3/screens/trailer_player_screen/trailer_player.dart';
import 'package:movie_app_3/screens/movie_detail_screen/widget/cast_movie.dart';
import 'package:movie_app_3/screens/movie_detail_screen/widget/movie_info.dart';
import 'package:movie_app_3/screens/movie_detail_screen/widget/similar_movie.dart';
import 'package:movie_app_3/style/theme.dart' as Style;

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailScreen({Key key, @required this.movie}) : super(key: key);
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(movie);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final Movie movie;
  _MovieDetailScreenState(this.movie);

  @override
  void initState() {
    super.initState();
    movieVideosBloc..getMovieVideos(movie.id);
  }

  @override
  void dispose() {
    super.dispose();
    movieVideosBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Style.Colors.mainColor,
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
        child: Builder(
          builder: (context) {
            return SliverFab(
              floatingPosition: FloatingPosition(
                right: MediaQuery.of(context).size.width * 0.4,
                left: MediaQuery.of(context).size.width * 0.4,
              ),
              floatingWidget: StreamBuilder<VideoResponse>(
                stream: movieVideosBloc.subject.stream,
                builder: (context, AsyncSnapshot<VideoResponse> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.error != null &&
                        snapshot.data.error.length > 0) {
                      return _buildErrorWidget(snapshot.data.error);
                    }
                    return _buildVideoWidget(snapshot.data);
                  } else if (snapshot.hasError) {
                    return _buildErrorWidget(snapshot.error);
                  } else {
                    return _buildLoadingWidget();
                  }
                },
              ),
              expandedHeight: 90.0,
              slivers: <Widget>[
                new SliverAppBar(
                  backgroundColor: Style.Colors.firstColor,
                  expandedHeight: 200.0,
                  pinned: true,
                  flexibleSpace: new FlexibleSpaceBar(
                      // titlePadding: EdgeInsets.only(bottom: 15, left: 50),
                      centerTitle: true,
                      title: Text(
                          movie.title.length > 40
                              ? movie.title.substring(0, 30) + "..."
                              : movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: movie.title.length < 20
                              ? TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                )
                              : TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                )),
                      background: Stack(
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/" +
                                          movie.backPoster)),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: [
                                    0.1,
                                    0.9
                                  ],
                                  colors: [
                                    Colors.black.withOpacity(0.9),
                                    Colors.black.withOpacity(0.0)
                                  ]),
                            ),
                          ),
                        ],
                      )),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(0.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Chip(
                            backgroundColor: Style.Colors.secondColor,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            label: Text(
                              "Rating:  ${movie.rating.toString()}",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "OVERVIEW",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0),
                              ),
                              Divider(
                                color: Colors.white,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.8,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  movie.overview,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MovieInfo(
                          id: movie.id,
                        ),
                        Casts(
                          id: movie.id,
                        ),
                        SimilarMovies(id: movie.id)
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
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

  Widget _buildVideoWidget(VideoResponse data) {
    List<Video> videos = data.videos;
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.6),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailerPlayerScreen(
                  controller: YoutubePlayerController(
                    initialVideoId: videos[0].key,
                    flags: YoutubePlayerFlags(
                      autoPlay: true,
                      mute: true,
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(
            Icons.play_arrow,
            size: 40,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Trailer',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
