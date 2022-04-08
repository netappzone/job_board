import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board/constants/strings.dart';
import 'package:job_board/pages/splash.dart';

import 'logic/app_cubit.dart';
import 'pages/home.dart';

class AppRouter {
  // Repository repository;
  // TodosCubit todosCubit;

  AppRouter() {
    // repository = Repository(networkService: NetworkService());
    // todosCubit = TodosCubit(repository: repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AppCubit()..getAllJobs(),
            child: const HomePage(),
          ),
        );

      default:
        return null;
    }
  }
}
