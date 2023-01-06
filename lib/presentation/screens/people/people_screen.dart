import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/app_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../views/person_grid_tile.dart';
import '../../widgets/default_error_widget.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late AppCubit cubit;

  Future<void> getPopularPersons() async {
    await cubit.getPopularPersons();
  }

  @override
  void initState() {
    cubit = AppCubit.get(context);
    getPopularPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if(state is PopularPersonsLoaded || state is AppChangeBottomNavBarState || state is PersonDetailsLoaded){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: cubit.popularPersons.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: PersonGridTile(person: cubit.popularPersons[index]),
                );
              },
            );
          }else if(state is AppLoadingState){
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


