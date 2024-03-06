import 'package:flutter/material.dart';
import 'package:mini_social_app/feature/setting/presentation/view/widget/settingScreenAppBar.dart';
import 'package:mini_social_app/feature/setting/presentation/view/widget/settingScreenBody.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: settingScreenAppBar(context),
      body: const SettingScreenBody(),
    );
  }
}
