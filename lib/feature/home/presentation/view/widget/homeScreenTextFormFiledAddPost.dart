import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/widgets/customTextFormWidget.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_cubit.dart';

class HomeScreenTextFormFiledAddPost extends StatelessWidget {
  const HomeScreenTextFormFiledAddPost({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormWidget(
              hintText: "Say something..",
              validator: (value) {
                return null;
              },
              textEditingController: textEditingController,
              obSecureText: false,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (textEditingController.text.isNotEmpty) {
                BlocProvider.of<HomeCubit>(context)
                    .addPostsHomeMethod(textEditingController.text);
                textEditingController.clear();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(left: 10),
              child: Center(
                child: Icon(
                  Icons.done,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
