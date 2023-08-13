import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/screens.dart' as screens;
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    Timer(
      const Duration(milliseconds: 5000),
      () => Navigator.pushNamedAndRemoveUntil(
          context, screens.homeLayout, (route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            /*  FadeTransition(
                opacity: _animation,
                child: SvgPicture.asset(
                  //'assets/splash.svg',
                  height: 30.h,
                  width: 50.w,
                ),
              ),*/
              Text(
                'Movies',
                style: TextStyle(
                  color: lightPurple,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
