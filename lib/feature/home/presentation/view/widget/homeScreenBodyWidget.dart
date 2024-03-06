import 'package:flutter/material.dart';
import 'package:mini_social_app/feature/home/presentation/view/widget/homeScreenTextFormFiledAddPost.dart';
import 'package:mini_social_app/feature/home/presentation/view/widget/homeStreamBuilderViewBodyScreen.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/bloc/home_bloc.dart';

class HomeScreenBodyWidget extends StatelessWidget {
  HomeScreenBodyWidget({super.key, required this.homeState});
  final TextEditingController textEditingController = TextEditingController();
  final HomeState homeState;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenTextFormFiledAddPost(
            textEditingController: textEditingController),
        const HomeStreamBuilderViewBodyScreen()
      ],
    );
  }
}
