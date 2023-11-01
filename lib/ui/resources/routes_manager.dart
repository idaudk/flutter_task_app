// import 'package:flutter/material.dart';
// import 'package:task_app/ui/login/login_screen.dart';
// import '../splash/splash_screen.dart';
// import 'reources.dart';

// class Routes {
//   static const String splash = "/";
//   static const String onBoarding = "/onboarding";
//   static const String login = "/login";
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(
//     RouteSettings routeSettings,
//   ) {
//     switch (routeSettings.name) {
//       case Routes.splash:
//         return MaterialPageRoute(builder: (_) => const SplashScreen());
//       // case Routes.login:
//       //   return MaterialPageRoute(builder: (_) => const LoginScreen());
//       case Routes.login:
//         return PageRouteBuilder(
//           pageBuilder: (_, __, ___) => LoginScreen(),
//           transitionsBuilder: (_, animation, __, child) {
//             // Implement your custom transition here
//             return SlideTransition(
//               position: Tween<Offset>(
//                 // begin: Offset(1.0, 0.0), // Starting position
//                 end: Offset.zero, // Ending position
//               ).animate(animation),
//               child: child,
//             );
//           },
//         );
//       default:
//         return unDefinedRoute();
//     }
//   }

//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: const Text(Strings.noRouteFound),
//               ),
//               body: const Center(child: Text(Strings.noRouteFound)),
//             ));
//   }
// }
