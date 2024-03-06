import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/core/widgets/CustomBackButton.dart';
import 'package:mini_social_app/feature/users/presentation/viewModel/bloc/users_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UsersBloc()..add(GetUsersEvent()),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            switch (state.getUsersState) {
              case RequestState.normal:
                return const Text("");
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.success:
                return Column(
                  children: [
                    CustomBackButton(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getUsersData!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.getUsersData![index].name!),
                            subtitle: Text(state.getUsersData![index].email!),
                            leading: const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/premium-vector/text-effect-with-writing-stuck-wall_269039-74.jpg'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              case RequestState.erorr:
                return const Text("");
            }
          },
        ),
      ),
    );
  }
}
