import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/person_details.dart';
import 'package:movies_app/data/models/tvshow.dart';
import 'package:movies_app/data/repository/genres_repository.dart';
import 'package:movies_app/data/repository/movies_repository.dart';
import 'package:movies_app/data/repository/persons_repository.dart';
import 'package:movies_app/data/repository/tvshows_repository.dart';
import 'package:movies_app/presentation/screens/movies/movies_screen.dart';
import 'package:movies_app/presentation/screens/people/people_screen.dart';
import 'package:movies_app/presentation/screens/tv_shows/tvshows_screen.dart';
import 'package:movies_app/presentation/styles/colors.dart';

import '../data/models/person.dart';
import '../data/models/movie.dart';
import '../data/repository/trending_repository.dart';
import '../presentation/screens/trending/trending_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.moviesRepository, this.tvShowsRepository, this.personsRepository, this.trendingRepository, this.genresRepository) : super(AppInitial());
  final MoviesRepository moviesRepository;
  final TvShowsRepository tvShowsRepository;
  final PersonsRepository personsRepository;
  final TrendingRepository trendingRepository;
  final GenresRepository genresRepository;
  List<Widget> screens =[
    const MoviesScreen(),
    const TvShowsScreen(),
    const PeopleScreen(),
    const TrendingScreen()
  ];
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  var currentIndex =0 ;
  List<String> screenTitles=[
    'Movies','Tv Shows','People' ,'Trending'
  ];
  List<Color> colors =[
    deepNetflixRed,blue,Colors.yellow,Colors.green
  ];
  List<Movie> popularMovies=[];
  List<Movie> topMovies=[];
  List<Movie> upcomingMovies=[];
  List<TvShow> popularTvShows=[];
  List<TvShow> topTvShows=[];
  List<Person> popularPersons =[];
  List trendingToday =[];
  List movieGenres=[];
  List tvShowGenres=[];
  void changeIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }
  Future<List<Movie>> getPopularMovies() async{
    emit(AppLoadingState());
    await moviesRepository.getPopularMovies().then((movies) {
      popularMovies =movies;
      emit(PopularMoviesLoaded());
    }).catchError((error){emit(AppErrorState());});
    return popularMovies;
  }
  Future<List<Movie>> getTopMovies() async{
    emit(AppLoadingState());
    await moviesRepository.getTopMovies().then((movies) {
      topMovies =movies;
      emit(TopMoviesLoaded());
    }).catchError((error){emit(AppErrorState());});
    return topMovies;
  }
  Future<List<Movie>> getUpcomingMovies() async{
    emit(AppLoadingState());
    await moviesRepository.getUpcomingMovies().then((movies) {
      upcomingMovies =movies;
      emit(UpcomingMoviesLoaded());
    }).catchError((error){emit(AppErrorState());});
    return upcomingMovies;
  }
  Future<List<TvShow>> getPopularTvShows() async{
    emit(AppLoadingState());
    await tvShowsRepository.getPopularTvShows().then((tvShows) {
      popularTvShows =tvShows;
      emit(PopularTvShowsLoaded());
    }).catchError((error){emit(AppErrorState());});
    return popularTvShows;
  }
  Future<List<TvShow>> getTopTvShows() async{
    emit(AppLoadingState());
    await tvShowsRepository.getTopTvShows().then((tvShows) {
      topTvShows =tvShows;
      emit(TopTvShowsLoaded());
    }).catchError((error){emit(AppErrorState());});
    return topTvShows;
  }
  Future<List<Person>> getPopularPersons() async{
    emit(AppLoadingState());
    await personsRepository.getPopularPersons().then((persons) {
      popularPersons =persons;
      emit(PopularPersonsLoaded());
    }).catchError((error){
      emit(AppErrorState());
    });
    return popularPersons;
  }
  Future<List> getTrendingToday() async{
    emit(AppLoadingState());
    await trendingRepository.getTrending().then((items) {
      trendingToday =items;
      emit(TrendingTodayLoaded());
    }).catchError((error){
      emit(AppErrorState());
    });
    return trendingToday;
  }
  Future getGenres() async{
    emit(AppLoadingState());
    await genresRepository.getMovieGenres().then((genres){
      movieGenres =genres;
    }).catchError((error){
      emit(AppErrorState());
    });
    await genresRepository.getTvShowGenres().then((genres){
      tvShowGenres =genres;
    }).catchError((error){
      emit(AppErrorState());
    });
  }
  Future<PersonDetails> getPerson(int id) async{
    try{
      emit(AppLoadingState());
      PersonDetails person =await personsRepository.getPerson(id);
      emit(PersonDetailsLoaded());
      return person;
    }catch(e,stacktrace){
      print('e' + stacktrace.toString());
      emit(AppErrorState());
      return PersonDetails(id: 0);
    }
  }
}
