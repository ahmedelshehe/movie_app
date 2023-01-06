import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/models/tvshow.dart';
import 'package:movies_app/presentation/views/movie_item.dart';
import 'package:movies_app/presentation/views/tvShow_item.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../widgets/default_error_widget.dart';
class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late AppCubit cubit;
  Future<void> getTrendingToday() async {
    await cubit.getTrendingToday();
  }
  @override
  void initState() {
    cubit = AppCubit.get(context);
    getTrendingToday();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if(state is TrendingTodayLoaded || state is AppChangeBottomNavBarState){
          return ListView.builder(
            itemCount: cubit.trendingToday.length,
            itemBuilder: (context, index)  {
              if(cubit.trendingToday[index] is Movie){
                return MovieItem(cubit.trendingToday[index]);
              }else if(cubit.trendingToday[index] is TvShow){
                return TvShowItem(tvShow: cubit.trendingToday[index]);
              }else {
                return MovieItem(cubit.trendingToday[index]);
              }
            } ,
          );
        } else if(state is AppLoadingState){
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
        }else{
          return const DefaultErrorWidget();
        }

      },
    );
  }
}
