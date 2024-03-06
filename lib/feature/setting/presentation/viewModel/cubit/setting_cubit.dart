import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/theme/theme.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState());

  changeThemeMode() async {
    await ThemeService.changeDarkMode();
    emit(ThemeSettingChangedState());
  }
}
