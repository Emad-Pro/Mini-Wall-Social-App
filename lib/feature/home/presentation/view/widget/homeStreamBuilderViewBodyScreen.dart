import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/core/widgets/customListTile.dart';
import 'package:mini_social_app/feature/home/presentation/view/method/convertTimeStampMethod.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_state.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/cubit/home_cubit.dart';

class HomeStreamBuilderViewBodyScreen extends StatelessWidget {
  const HomeStreamBuilderViewBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.postsRequestState) {
            case RequestHomeState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestHomeState.success:
              if (state.postsModel!.isEmpty) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("posts is empty , say something"),
                    )
                  ],
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.postsModel!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12)),
                            child: CustomListTile(
                              title: state.postsModel![index].postsMessage!,
                              date: convertTimeStampMethod(
                                  state.postsModel![index].timeStmp!),
                              subtitle: state.postsModel![index].email!,
                            ),
                          ),
                        );
                      }),
                );
              }
            case RequestHomeState.erorr:
              return const Text("some Error");
          }
        },
        listener: (context, state) {});
  }
}
