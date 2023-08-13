import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/data/remote/requests/movies_request.dart';
import 'package:movies_app/data/remote/requests/persons_request.dart';
import 'package:movies_app/data/remote/requests/tv_request.dart';
import 'package:movies_app/data/remote/responses/movies_response.dart';
import 'package:movies_app/data/remote/responses/persons_response.dart';
import 'package:movies_app/data/remote/responses/tv_shows_response.dart';
import 'package:movies_app/presentation/screens/movies/movies_screen.dart';
import 'package:movies_app/presentation/screens/persons/persons_screen.dart';
import 'package:movies_app/presentation/screens/tvshows/tv_shows.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  MoviesResponse moviesResponse = MoviesResponse();
  TvShowsResponse tvShowsResponse = TvShowsResponse();
  PersonsResponse personsResponse = PersonsResponse();
  int currentIndex = 0;

  List<Widget> screens = [
    const MoviesScreen(),
    const TvShowScreen(),
    const PersonScreen(),
  ];
  List<String> texts = ['Movies', 'TvShows', 'Persons'];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void getMovies() {
    emit(AppMoviesLoadingState());
    MoviesRequest()
        .moviesRequest(apiKey: '580f82da56cf5bbc362bd87619034d3c')
        .then((value) {
      moviesResponse = value;
      emit(AppMoviesSuccessState());
    }).catchError((error) {
      emit(AppMoviesErrorState());
    });
  }

  String imageUrl({required String imagePath}) {
    return '$imagesBaseURL$imagePath';
  }

  void getTvShows() {
    emit(AppTvShowsLoadingState());
    TvRequest()
        .tvRequest(apiKey: '580f82da56cf5bbc362bd87619034d3c')
        .then((value) {
      tvShowsResponse = value;
      emit(AppTvShowsSuccessState());
    }).catchError((error) {
      emit(AppTvShowsErrorState());
    });
  }

  void getPersons() {
    emit(AppPersonsLoadingState());
    PersonsRequest()
        .personsRequest(apiKey: '580f82da56cf5bbc362bd87619034d3c')
        .then((value) {
      personsResponse = value;
      emit(AppPersonsSuccessState());
    }).catchError((error) {
      emit(AppPersonsErrorState());
    });
  }
}
