import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/core/widgets/CustomBackButton.dart';
import 'package:mini_social_app/feature/profile/presentation/viewModel/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
        create: (context) => ProfileBloc()..add(GetUserDetailsProfileEvent()),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.normal:
                return const Text("");
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.success:
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomBackButton(),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/premium-vector/text-effect-with-writing-stuck-wall_269039-74.jpg'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        state.profileModel!.name!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state.profileModel!.email!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              case RequestState.erorr:
                return Text(state.erorrMessage);
            }
          },
        ),
      ),
    );
  }
}
