import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/widgets/default_apppar.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../style/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AppCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)
      ..getMovies()
      ..getTvShows()
      ..getPersons();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: DefaultAppPar(title: cubit.texts[cubit.currentIndex]),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    black,
                    darkRed,
                    black,
                  ],
                )),
              ),
              BlocBuilder<AppCubit, AppState>(
                builder: (BuildContext context, state) {
                  if (state is AppMoviesLoadingState ||
                      state is AppTvShowsLoadingState ||
                      state is AppPersonsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is AppMoviesSuccessState ||
                      state is AppTvShowsSuccessState ||
                      state is AppPersonsSuccessState ||
                      state is AppChangeBottomNavBarState) {
                    return cubit.screens[cubit.currentIndex];
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            size: 75.sp,
                            color: Colors.red,
                          ),
                          Text(
                            'Error Occurred',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.white,
              unselectedItemColor: darkRed,
              elevation: 0,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeIndex(index),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.movie_creation_outlined),
                    label: cubit.texts[0],
                    backgroundColor: Colors.black),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.tv_rounded),
                    label: cubit.texts[1],
                    backgroundColor: Colors.black),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person_sharp),
                    label: cubit.texts[2],
                    backgroundColor: Colors.black),
              ]),
        );
      },
    );
  }
}
