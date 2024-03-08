import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/feature/auth/signIn/presentation/view/SignInScreen.dart';

import 'package:mini_social_app/feature/home/presentation/view/widget/homeScreenAppBarWidget.dart';
import 'package:mini_social_app/feature/home/presentation/view/widget/homeScreenBodyWidget.dart';
import 'package:mini_social_app/feature/home/presentation/view/widget/homeScreenDrawerWidget.dart';

import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_cubit.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_state.dart';
import 'package:motion_toast/motion_toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..listenToGetPosts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.signOutState == RequestState.success) {
            MotionToast.success(
              title: const Text(
                "LogOut",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              description: const Text("Successful logout"),
            ).show(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: homeScreenAppBarWidget(state, context),
            drawer: const HomeScreenDrawerWidget(),
            body: HomeScreenBodyWidget(
              homeState: state,
            ),
          );
        },
      ),
    );
  }
}
