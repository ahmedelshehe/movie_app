import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../views/tvShow_item.dart';
import '../../widgets/default_error_widget.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({Key? key}) : super(key: key);

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  late AppCubit cubit;
  Future<void> getPopularTvShows() async {
    await cubit.getPopularTvShows();
  }
  Future<void> getTopTvShows() async {
    await cubit.getTopTvShows();
  }
  @override
  void initState() {
    cubit = AppCubit.get(context);
    getPopularTvShows();
    getTopTvShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is PopularTvShowsLoaded ||
              state is TopTvShowsLoaded ||
              state is AppChangeBottomNavBarState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'Popular Tv Shows',
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
                      return TvShowItem(
                        tvShow: cubit.popularTvShows[index],
                      );
                    },
                    itemCount: cubit.popularTvShows.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'Top Tv Shows',
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
                      return TvShowItem(
                        tvShow: cubit.topTvShows[index],
                      );
                    },
                    itemCount: cubit.topTvShows.length,
                  ),
                ),

              ],
            );
          } else if(state is AppLoadingState) {
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
