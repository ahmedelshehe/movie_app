part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppChangeBottomNavBarState extends AppState {}
class AppLoadingState extends AppState {}
class PopularMoviesLoaded extends AppState {}
class PopularTvShowsLoaded  extends AppState {}
class TopMoviesLoaded  extends AppState {}
class UpcomingMoviesLoaded  extends AppState {}
class TopTvShowsLoaded  extends AppState {}
class AppErrorState  extends AppState {}
class PopularPersonsLoaded  extends AppState {}
class TrendingTodayLoaded  extends AppState {}
class PersonDetailsLoaded  extends AppState {}