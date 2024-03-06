import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/sharedPreferences/cacheHelper.dart';
import 'package:mini_social_app/core/theme/theme.dart';
import 'package:mini_social_app/feature/auth/signIn/presentation/view/SignInScreen.dart';
import 'package:mini_social_app/feature/auth/signIn/presentation/viewModel/bloc/sign_in_bloc.dart';
import 'package:mini_social_app/feature/auth/signUp/presentation/view/signUpScreen.dart';
import 'package:mini_social_app/feature/auth/signUp/presentation/viewModel/bloc/sign_up_bloc.dart';
import 'package:mini_social_app/feature/home/presentation/view/homeScreen.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/bloc/home_bloc.dart';

import 'package:mini_social_app/feature/mainViewBody.dart';
import 'package:mini_social_app/core/firebase_options.dart';
import 'package:mini_social_app/feature/profile/presentation/view/profileScreen.dart';
import 'package:mini_social_app/feature/setting/presentation/view/widget/settingScreen.dart';
import 'package:mini_social_app/feature/setting/presentation/viewModel/cubit/setting_cubit.dart';
import 'package:mini_social_app/feature/users/presentation/view/usersScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ThemeService.settingDarkModeInit();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SettingCubit()),
      ],
      child: Builder(builder: (context) {
        context.watch<SettingCubit>().state;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Social Wall',
          theme: ThemeService().lightMode,
          darkTheme: ThemeService().darkMode,
          home: const MainViewBody(),
          themeMode:
              ThemeService.darkModeValue ? ThemeMode.dark : ThemeMode.light,
          routes: {
            "/signInScreen": (context) => SignInScreen(),
            "/signUpScreen": (context) => SignUpScreen(),
            "/homeScreen": (context) => const HomeScreen(),
            "/usersScreen": (context) => const UsersScreen(),
            "/profileScreen": (context) => const ProfileScreen(),
            "/settingScreen": (context) => const SettingScreen()
          },
        );
      }),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
