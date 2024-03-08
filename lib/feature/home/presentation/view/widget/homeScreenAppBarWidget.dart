import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/enum/enum.dart';

import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_state.dart';

AppBar homeScreenAppBarWidget(HomeState state, BuildContext context) {
  return AppBar(
    title: const Text("Wall Social"),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: Theme.of(context).colorScheme.inversePrimary,
  );
}
