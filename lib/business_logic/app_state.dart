part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

class AppMoviesLoadingState extends AppState {}

class AppMoviesSuccessState extends AppState {}

class AppMoviesErrorState extends AppState {}

class AppTvShowsLoadingState extends AppState {}

class AppTvShowsSuccessState extends AppState {}

class AppTvShowsErrorState extends AppState {}

class AppPersonsLoadingState extends AppState {}

class AppPersonsSuccessState extends AppState {}

class AppPersonsErrorState extends AppState {}
