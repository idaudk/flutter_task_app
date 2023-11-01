import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/blocs/mood_reason_bloc/mood_reason_bloc.dart';
import 'package:task_app/routes/route_generator.dart';

import 'ui/resources/reources.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final gridBloc = GridBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider<GridBloc>(
          create: (BuildContext context) => gridBloc,
        ),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: const Size(390, 844),
          builder: (context, child) {
            return MaterialApp(
              title: Strings.appName,
              debugShowCheckedModeBanner: false,
              theme: getApplicationTheme(),
              initialRoute: Routes.splash,
              onGenerateRoute: RouteGenerator().generateRoute,
            );
          }),
    );
  }
}
