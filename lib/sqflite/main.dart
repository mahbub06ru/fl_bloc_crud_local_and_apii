import 'package:flutetr_bloc_crud_databse_api/sqflite/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/core/observer.dart';
import '../api/env.dart';
import '../api/presentation/styles/theme.dart';
import '../api/presentation/styles/theme_bloc/theme_bloc.dart';
import '../api/router/app_route_config.dart';
import 'bloc/crud_bloc.dart';
import 'page/details_page.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => CrudBloc()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const SplashScreen(),
//       ),
//     );
//   }
// }
//

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeBloc()..add(ThemeInitialEvent())),
        ],
        child: Builder(builder: (context) {
          final isDarkTheme = context.watch<ThemeBloc>().state.isDarkTheme;
          return MaterialApp(
            title: Environments.appName,
            initialRoute: AppRouter.initialRoute,
            onGenerateRoute: AppRouter.onGenerateRouted,
            debugShowCheckedModeBanner: false,
            theme: isDarkTheme
                ? appThemeData[AppTheme.dark]
                : appThemeData[AppTheme.light],
          );
        }));
  }
}