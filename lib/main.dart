import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/remote/data_providers/my_dio.dart';
import 'package:movies_app/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/app_cubit.dart';
import 'core/my_bloc_observers.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  MyDio.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(

          create: (context) => AppCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Simple Contacts',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
