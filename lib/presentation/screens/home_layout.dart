import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/app_cubit.dart';
import 'package:movies_app/presentation/widgets/default_text.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AppCubit cubit;
  Future getGenres() async{
    cubit.getGenres();
  }
  @override
  void initState() {
    cubit = AppCubit.get(context);
    getGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: false,
          backgroundColor: cubit.colors[cubit.currentIndex],
          appBar: AppBar(
            backgroundColor: cubit.colors[cubit.currentIndex],
            title: DefaultText(
              text: cubit.screenTitles[cubit.currentIndex],
              color: Colors.black87,
            ),
            centerTitle: true,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
            elevation: 0,
            type: BottomNavigationBarType.shifting,
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation_outlined),
                  label: 'Movies',
                  backgroundColor: cubit.colors[cubit.currentIndex]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tv_outlined),
                  label: 'Tv Shows',
                  backgroundColor: cubit.colors[cubit.currentIndex]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'People',
                  backgroundColor: cubit.colors[cubit.currentIndex]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: 'Trending',
                  backgroundColor: cubit.colors[cubit.currentIndex]),
            ],
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
