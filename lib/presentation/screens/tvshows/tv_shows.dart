import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/view/tv_show_item.dart';
import 'package:sizer/sizer.dart';


import '../../../business_logic/app_cubit.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({Key? key}) : super(key: key);

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
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
                  TvItem(tvModel: cubit.tvShowsResponse.results[index]),
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
              itemCount: cubit.tvShowsResponse.results.length),
        );
      },
    );
  }
}
