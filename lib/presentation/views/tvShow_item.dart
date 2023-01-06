import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/screens.dart';
import '../../data/models/tvshow.dart';
import '../widgets/default_cached_image.dart';
import '../widgets/default_text.dart';

class TvShowItem extends StatelessWidget {
  const TvShowItem({Key? key, required this.tvShow}) : super(key: key);
  final TvShow tvShow;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(tvShowDetailsScreen,arguments: tvShow);
      },
      child: Container(
        width: 90.w,
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DefaultCachedImage(backdropPath: tvShow.backdropPath),
            ),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.w, bottom: 2.w, left: 2.w),
                      child: DefaultText(
                        text: tvShow.name,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 1.sp,horizontal: 2.sp),
                          margin: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 1.sp),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5.sp)
                          ),
                          child: DefaultText(
                            text: 'Year : ${tvShow.firstAirDate.substring(0,4)}',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.sp),
                          padding: EdgeInsets.symmetric(vertical: 1.sp,horizontal: 2.sp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.sp)
                          ),
                          child: DefaultText(
                            text: 'Language : ${tvShow.originalLanguage}',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 1.w, top: 5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultText(
                        text: tvShow.voteAverage.toString(),
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
