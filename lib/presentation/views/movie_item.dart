import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
import '../../constants/screens.dart';
import '../../data/models/movie.dart';
import '../widgets/default_cached_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem(this.movie, {Key? key}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(movieDetailsScreen,arguments: movie);
      } ,
      child: Container(
        width: 90.w,
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultCachedImage(backdropPath: movie.backdropPath),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.w, bottom: 2.w, left: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: movie.title,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.sp, horizontal: 2.sp),
                            margin: EdgeInsets.symmetric(horizontal: 5.sp),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: DefaultText(
                              text: 'Year : ${movie.releaseDate.substring(0, 4)}',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.sp),
                            padding: EdgeInsets.symmetric(
                                vertical: 1.sp, horizontal: 2.sp),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: DefaultText(
                              text: 'Language : ${movie.originalLanguage}',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 1.w, top: 5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultText(
                        text: movie.voteAverage.toString(),
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                        size: 6.w,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


