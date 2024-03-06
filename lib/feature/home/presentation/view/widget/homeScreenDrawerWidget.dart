import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/feature/home/presentation/viewModel/bloc/home_bloc.dart';

class HomeScreenDrawerWidget extends StatelessWidget {
  const HomeScreenDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.favorite,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
          const SizedBox(
            height: 25,
          ),
          CustomListTileWidget(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Home",
            icon: Icons.home,
          ),
          CustomListTileWidget(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/profileScreen");
            },
            text: "Profile",
            icon: Icons.person,
          ),
          CustomListTileWidget(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/usersScreen");
            },
            text: "Users",
            icon: Icons.groups,
          ),
          CustomListTileWidget(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/settingScreen");
            },
            text: "Settings",
            icon: Icons.settings,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CustomListTileWidget(
              onTap: () {
                BlocProvider.of<HomeBloc>(context).add(SignUpHomeEvent());
              },
              text: "SignOut",
              icon: Icons.logout_sharp,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData icon;

  const CustomListTileWidget(
      {super.key, this.onTap, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          text.toUpperCase(),
          style: const TextStyle(
            letterSpacing: 2,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
