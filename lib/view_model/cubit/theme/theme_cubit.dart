import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../view/constant/color_manager.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context) => BlocProvider.of(context);

  Widget icon = const Icon(Icons.brightness_4_outlined, color: mainColor,);
  bool isDark = false;

  void changeAppTheme(){
    isDark = !isDark;
    if(isDark){
      icon = const Icon(Icons.brightness_4_outlined, color: mainColor,);
    } else if(!isDark){
      icon = const Icon(Icons.brightness_2_outlined, color: mainColor,);
    }
    emit(ChangeThemeState());
  }
}
