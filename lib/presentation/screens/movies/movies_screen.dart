import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/app_cubit.dart';
import 'package:movies_app/presentation/view/movies_item.dart';
import 'package:sizer/sizer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(10.sp),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  MoviesItem(movieModel: cubit.moviesResponse.results[index]),
              separatorBuilder: (context, index) =>
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                            height: 1.h,
                            color: Colors.transparent,
                          ))
                    ],
                  ),
              itemCount: cubit.moviesResponse.results.length),
        );
      },
    );
  }
}
