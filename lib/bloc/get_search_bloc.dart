// import 'package:movie_app_3/model/movie_response.dart';
// import 'package:movie_app_3/repository/repository.dart';
// import 'package:rxdart/rxdart.dart';

// class SearchListBloc {
//   final MovieRepository _repository = MovieRepository();
//   final BehaviorSubject<MovieResponse> _subject =
//       BehaviorSubject<MovieResponse>();

//   getSearch(String query) async {
//     MovieResponse response = await _repository.getSearch(query);
//     _subject.sink.add(response);
//   }

//   dispose() {
//     _subject.close();
//   }

//   BehaviorSubject<MovieResponse> get subject => _subject;
// }

// final searchBloc = SearchListBloc();
