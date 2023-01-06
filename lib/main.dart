import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/repository/genres_repository.dart';
import 'package:movies_app/data/repository/trending_repository.dart';
import 'package:movies_app/data/repository/tvshows_repository.dart';
import 'package:movies_app/data/web_services/genres_web_service.dart';
import 'package:movies_app/data/web_services/movies_web_service.dart';
import 'package:movies_app/data/web_services/trending_web_service.dart';
import 'package:movies_app/data/web_services/tvshows_web_service.dart';
import 'package:movies_app/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';
import 'business_logic/app_cubit.dart';
import 'constants/bloc_observer.dart';
import 'data/repository/movies_repository.dart';
import 'data/repository/persons_repository.dart';
import 'data/web_services/persons_web_service.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => AppCubit(
          MoviesRepository(MoviesWebService()),
          TvShowsRepository(TvShowsWebService()),
          PersonsRepository(PersonsWebService()),
          TrendingRepository(TrendingWebService()),
          GenresRepository(GenresWebService())
      ),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Contacts',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      }),
    );
  }
}
