import 'package:flutter/material.dart';
import 'package:movies_app/core/screens.dart' as screens;
import 'package:movies_app/data/remote/responses/movies_response.dart';
import 'package:movies_app/data/remote/responses/tv_shows_response.dart';
import 'package:movies_app/presentation/screens/movies/movies_details.dart';
import 'package:movies_app/presentation/screens/splash/splash_screen.dart';
import 'package:movies_app/presentation/screens/tvshows/tv_shows_details.dart';
import '../screens/homelayout/home_layout.dart';

class AppRouter {
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.moviesDetailsScreen:
        MoviesResults moviesModel = settings.arguments as MoviesResults;
        return MaterialPageRoute(
            builder: (_) => MoviesDetails(moviesModel: moviesModel));
      case screens.tvShowsDetailsScreen:
        TvResults tvModel = settings.arguments as TvResults;
        return MaterialPageRoute(
            builder: (_) => TvShowsDetails(tvModel: tvModel));

      default:
        return null;
    }
  }
}
