import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/blocs/home_bloc/home_bloc.dart';
import 'package:task_app/blocs/login_bloc/login_bloc.dart';
import 'package:task_app/blocs/mood_bloc/mood_bloc.dart';
import 'package:task_app/blocs/mood_reason_bloc/mood_reason_bloc.dart';
import 'package:task_app/ui/home/home_screen.dart';
import 'package:task_app/ui/login/login_screen.dart';
import 'package:task_app/ui/mood/mood_screen.dart';
import 'package:task_app/ui/mood_reason/mood_reason_screen.dart';
import 'package:task_app/ui/splash/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String home = "/home";
  static const String mood = "/mood";
  static const String moodReason = "/mood-reason";
}

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>.value(
            value: LoginBloc(),
            child: const LoginScreen(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CalendarBloc>.value(
            value: CalendarBloc(),
            child: const HomeScreen(),
          ),
        );

      case Routes.mood:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SliderBloc>.value(
            value: SliderBloc(),
            child: const MoodScreen(),
          ),
        );

      case Routes.moodReason:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<GridBloc>.value(
            value: GridBloc(),
            child: const MoodReasonScreen(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
