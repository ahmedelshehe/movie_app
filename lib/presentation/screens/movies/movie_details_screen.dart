import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/app_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/genre.dart';
import '../../../data/models/movie.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_image.dart';
import '../../widgets/default_text.dart';
class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late AppCubit cubit;
  List<String> genres=[];
  late ScrollController _controller;
  bool silverCollapsed = false;
  String myTitle = "";
  Future getGenres() async{
    int count =0;
    for(Genre genre in cubit.movieGenres ){
      for(num id in widget.movie.genreIds){
        if(id == genre.id && count <2){
          genres.add(genre.name);
          count++;
        }
      }
    }
  }
  @override
  void initState() {
    super.initState();
    cubit=AppCubit.get(context);
    getGenres();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 65.h && !_controller.position.outOfRange) {
        if(!silverCollapsed){
          myTitle = widget.movie.title;
          print('object');
          silverCollapsed = true;
          setState(() {});
        }
      }
      if (_controller.offset <= 65.h && !_controller.position.outOfRange) {
        if(silverCollapsed){
          myTitle = "";
          silverCollapsed = false;
          setState(() {});
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: deepNetflixRed,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: deepNetflixRed,
            expandedHeight: 80.h,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1.sp,
              stretchModes: [
                StretchMode.zoomBackground
              ],
              title: Text(
                myTitle,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: DefaultCachedImage(backdropPath: widget.movie.posterPath),
              ),
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Container(
                  color: deepNetflixRed,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp),bottomRight: Radius.circular(10.sp),topLeft: Radius.circular(30.sp)),
                                color: Colors.black12
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 1.h),
                            padding: EdgeInsets.all(8.sp),
                            width: 35.w,
                            child: Row(
                              children: [
                                Icon(Icons.star,size: 25.sp,color: Colors.yellow,),
                                Column(
                                  children: [
                                    DefaultText(
                                      text: '${widget.movie.voteAverage} / 10',
                                      fontSize: 12.sp,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    DefaultText(
                                      text: '${widget.movie.voteCount} voted',
                                      fontSize: 10.sp,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.sp),bottomLeft: Radius.circular(10.sp)),
                                color: Colors.black12
                            ),
                            height: 7.h,
                            width: 52.w,
                            child: Row(
                              children: [
                                DefaultText(
                                  text: 'Genres',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                DefaultText(
                                  text: genres.join(', '),
                                  fontSize: 9.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),bottomRight: Radius.circular(10.sp),topLeft: Radius.circular(30.sp)),
                            color: Colors.black12
                        ),
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(8.sp),
                        width: 95.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Overview',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: widget.movie.overview,
                              fontSize: 14.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),bottomRight: Radius.circular(10.sp)),
                          color: Colors.black12
                        ),
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(8.sp),
                        width: 95.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: 'Release Date',
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: widget.movie.releaseDate,
                              fontSize: 12.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),bottomRight: Radius.circular(10.sp)),
                            color: Colors.black12
                        ),
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(8.sp),
                        width: 95.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: 'Language',
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            DefaultText(
                              text: widget.movie.originalLanguage.toUpperCase(),
                              fontSize: 12.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
