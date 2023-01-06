import 'package:flutter/material.dart';
import 'package:movies_app/constants/screens.dart';
import 'package:movies_app/data/models/person.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_cached_image.dart';
import '../widgets/default_text.dart';

class PersonGridTile extends StatelessWidget {
  const PersonGridTile({
    Key? key, required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(peopleDetailsScreen,arguments: person);
      },
      child: GridTile(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  child: DefaultCachedImage(
                      backdropPath: person.profilePath,
                      height: 26.h),
                ),
                Positioned(
                  bottom: 1.sp,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),
                    padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 1.w),
                    alignment: Alignment.center,
                    child: DefaultText(
                      text: person.name,
                      textAlign: TextAlign.center,
                      fontSize: 10.sp,
                      color: Colors.white,
                    ),
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