import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/person_details.dart';
import 'package:movies_app/presentation/views/movie_item.dart';
import 'package:movies_app/presentation/views/tvShow_item.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../../data/models/movie.dart';
import '../../../data/models/person.dart';
import '../../../data/models/tvshow.dart';
import '../../widgets/default_cached_image.dart';
import '../../widgets/default_text.dart';

class PeopleDetailsScreen extends StatefulWidget {
  PeopleDetailsScreen({Key? key, required this.person}) : super(key: key);
  final Person person;
  @override
  State<PeopleDetailsScreen> createState() => _PeopleDetailsScreenState();
}

class _PeopleDetailsScreenState extends State<PeopleDetailsScreen> {
  late AppCubit cubit;
  late PersonDetails personDetails;
  Future getPerson() async {
    personDetails = await cubit.getPerson(widget.person.id as int);
  }

  @override
  void initState() {
    cubit = AppCubit.get(context);
    getPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> known = [];
    for (KnownFor i in widget.person.knownFor) {
      if (i.mediaType == 'tv') {
        known.add(i.name);
      } else {
        known.add(i.title);
      }
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.person.name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(10),
                            child: DefaultCachedImage(
                                backdropPath: widget.person.profilePath,
                                height: 30.h),
                          ),
                          Container(
                            width: 45.w,
                            height: 30.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 2.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'Known For',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        DefaultText(
                                          text:
                                              widget.person.knownForDepartment,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black45,
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'Gender',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        DefaultText(
                                          text: widget.person.gender == 1
                                              ? 'Female'
                                              : 'Male',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black45,
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: buildPopularForWidgets(known),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          if (state is PersonDetailsLoaded) {
                            return Theme(
                              data: ThemeData(
                                  backgroundColor: Colors.black,
                                  expansionTileTheme: ExpansionTileThemeData(
                                      iconColor: Colors.black)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ExpansionTile(
                                    textColor: Colors.black,
                                    title: DefaultText(
                                      text: 'Overview',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    collapsedIconColor: Colors.black,
                                    children: <Widget>[
                                      ListTile(
                                          title: Text(personDetails.biography)),
                                    ],
                                  ),
                                  ExpansionTile(
                                    textColor: Colors.black,
                                    title: DefaultText(
                                      text: 'Birthdate',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    collapsedIconColor: Colors.black,
                                    trailing: Text(personDetails.birthday),
                                  ),
                                  ExpansionTile(
                                    textColor: Colors.black,
                                    title: DefaultText(
                                      text: 'Place of birth',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    collapsedIconColor: Colors.black,
                                    children: <Widget>[
                                      ListTile(
                                          title:
                                              Text(personDetails.placeOfBirth)),
                                    ],
                                  ),
                                  ExpansionTile(
                                    textColor: Colors.black,
                                    title: DefaultText(
                                      text: 'Also Known As',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    collapsedIconColor: Colors.black,
                                    children: <Widget>[
                                      ListTile(
                                          title: Text(personDetails.alsoKnownAs
                                              .join(', '))),
                                    ],
                                  ),
                                  ExpansionTile(
                                    initiallyExpanded: true,
                                    textColor: Colors.black,
                                    title: DefaultText(
                                      text: 'Popular Discography',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    collapsedIconColor: Colors.black,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 100.w,
                                        height: 35.h,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: KnownForItemBuilder,
                                          itemCount: widget.person.knownFor.length,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                        },
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

  Widget KnownForItemBuilder(context, index) {
              KnownFor knownFor =
                  widget.person.knownFor[index];
              if (knownFor.mediaType == 'movie') {
                Movie movie = Movie(
                    id: knownFor.id,
                    backdropPath:
                        knownFor.backdropPath,
                    title: knownFor.title,
                    releaseDate:
                        knownFor.releaseDate,
                    voteAverage: knownFor.voteAverage,
                    voteCount: knownFor.voteCount,
                    originalLanguage:
                        knownFor.originalLanguage,
                  genreIds: knownFor.genreIds.map((e) => e as int).toList(),
                  overview: knownFor.overview,
                  posterPath: knownFor.posterPath

                );
                return MovieItem(movie);
              } else {
                TvShow tvShow=TvShow(id: knownFor.id,
                    backdropPath:
                    knownFor.backdropPath,
                    name: knownFor.name,
                    firstAirDate:
                    knownFor.firstAirDate,
                    voteAverage: knownFor.voteAverage,
                    voteCount: knownFor.voteCount,
                    originalLanguage:
                    knownFor.originalLanguage,
                    genreIds: knownFor.genreIds.map((e) => e as int).toList(),
                    overview: knownFor.overview,
                    posterPath: knownFor.posterPath
                );
                return TvShowItem(tvShow: tvShow,);
              }
            }

  List<Widget> buildPopularForWidgets(List<String> known) {
    List<Widget> widgets = [
      DefaultText(
        text: 'Popular for',
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
      ),
      Divider(
        color: Colors.black45,
        height: 1.h,
      ),
    ];
    for (String i in known) {
      widgets.add(DefaultText(
        text: i,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ));
    }
    return widgets;
  }
}
