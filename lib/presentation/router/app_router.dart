import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/models/person.dart';
import 'package:movies_app/data/models/tvshow.dart';
import 'package:movies_app/presentation/screens/home_layout.dart';
import 'package:movies_app/presentation/screens/movies/movie_details_screen.dart';
import 'package:movies_app/presentation/screens/people/people_details_screen.dart';

import '../../constants/screens.dart' as screens;
import '../screens/tv_shows/tvshow_details.dart';
class AppRouter{
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const HomeLayout();

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.movieDetailsScreen:
        return MaterialPageRoute(builder: (_)=>  MovieDetailsScreen(movie: settings.arguments as Movie) );
      case screens.tvShowDetailsScreen:
        return MaterialPageRoute(builder: (_)=>  TvShowDetailsScreen(tvShow: settings.arguments as TvShow) );
      case screens.peopleDetailsScreen:
        return MaterialPageRoute(builder: (_)=>  PeopleDetailsScreen(person: settings.arguments as Person,) );
      default:
        return null;
    }
  }

}
