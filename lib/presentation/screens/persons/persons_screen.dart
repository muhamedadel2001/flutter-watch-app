import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/view/person_item.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
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
                  PersonItem(personModel: cubit.personsResponse.results[index]),
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
              itemCount: cubit.personsResponse.results.length),
        );
      },
    );
  }
}
