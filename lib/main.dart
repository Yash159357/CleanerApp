import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internship_project/controller/cubits/job_list_cubit.dart';
import 'package:internship_project/firebase_options.dart';
import 'package:internship_project/view/auth/auth_screen.dart';
import 'package:flutter/services.dart';
import 'package:internship_project/view/home/home_screen.dart';

final _routes = GoRouter(
  initialLocation: "/auth",
  routes: [
    GoRoute(
      path: "/auth",
      name: "auth",
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return JobListCubit();
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: _routes,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
