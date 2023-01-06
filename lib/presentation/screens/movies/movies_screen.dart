import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/views/movie_item.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../widgets/default_error_widget.dart';
import '../../widgets/default_text.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late AppCubit cubit;
  Future<void> getPopularMovies()async {
    await cubit.getPopularMovies();
  }
  Future<void> getTopMovies()async {
    await cubit.getTopMovies();
  }
  Future<void> getUpcomingMovies()async {
    await cubit.getUpcomingMovies();
  }
  @override
  void initState() {
    cubit = AppCubit.get(context);
    getPopularMovies();
    getTopMovies();
    getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is PopularMoviesLoaded || state is TopMoviesLoaded || state is UpcomingMoviesLoaded || state is AppChangeBottomNavBarState)
            {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'Popular Movies',
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(

                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieItem(cubit.popularMovies[index]);
                    },
                    itemCount: cubit.popularMovies.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'Top Rated Movies',
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieItem(cubit.topMovies[index]);
                    },
                    itemCount: cubit.topMovies.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'Upcoming Movies',
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieItem(cubit.upcomingMovies[index]);
                    },
                    itemCount: cubit.upcomingMovies.length,
                  ),
                ),
              ],
            );
          }
          else if(state is AppLoadingState) {
            return SizedBox(
              width: 100.w,
              height: 85.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(color: Colors.redAccent,),
                  ],
                ),
              ),
            );
          }else {
            return const DefaultErrorWidget();
          }
        },
      ),
    );
  }
}
