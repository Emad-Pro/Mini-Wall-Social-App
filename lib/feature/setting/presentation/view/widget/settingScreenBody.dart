import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/theme/theme.dart';
import 'package:mini_social_app/feature/setting/presentation/viewModel/cubit/setting_cubit.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
          margin: const EdgeInsets.only(left: 25.0, right: 25, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DarkMode",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              CupertinoSwitch(
                  value: ThemeService.darkModeValue,
                  onChanged: (value) {
                    BlocProvider.of<SettingCubit>(context).changeThemeMode();
                  })
            ],
          ),
        );
      },
    );
  }
}
