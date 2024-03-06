import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/widgets/customListTile.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/bloc/home_bloc.dart';

class HomeStreamBuilderViewBodyScreen extends StatelessWidget {
  const HomeStreamBuilderViewBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<HomeBloc>(context).getPostsHomeMethod(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data == null) {
          return const Center(child: Text("No Posts.. Post something!"));
        } else {
          return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: CustomListTile(
                        title: snapshot.data!.docs[index]["postMessage"],
                        subtitle: snapshot.data!.docs[index]["userEmail"],
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
