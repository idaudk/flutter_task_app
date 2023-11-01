import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:task_app/ui/widgets/animations/animations.dart';
import '../../routes/route_generator.dart';
import '../resources/reources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: DurationConstant.d3000), () {
      Navigator.pushNamed(context, Routes.login);
      _timer.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: ColorManager.yellow, // status bar color
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.gradient1,
                ColorManager.gradient2
              ], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SlideAnimation(
            begin: Offset(0, 300),
            duration: Duration(milliseconds: 2000),
            child: FadeAnimation(
              child: Center(
                child: Hero(
                  tag: 'logoTag',
                  child: Text(
                    "Vitality",
                    style: context.textTheme.displayMedium!.copyWith(
                        fontSize: FontSize.s60.sp,
                        fontFamily: "Pauline",
                        color: ColorManager.mud),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
