import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/constant/assets.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial());

  OnboardCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  final PageController pageController = PageController();
  static List<String> illustrations = [
    illustration1,
    illustration2,
    illustration3,
  ];
  List<String> titles = [
    'Learning paths',
    'Assessments',
    'Development',
  ];
  List<String> subTitles = [
    'allow users to tailor their learning experience to their individual needs and goals',
    'Make quizzes and assignments to  courses and learning resources that are most relevant to the user\'s interests and goals.',
    'Our app offers a variety of courses to help you develop new skills and grow professionally',
  ];
  int pageCount = illustrations.length;
  String buttonText = 'Next';
  bool isFirstPage = true;

  void changeCurrentIndex(int index) {
    currentIndex == index;
    if(index == 0 || index == 1){
      buttonText = 'Next';
    } else if(index == 2) {
      buttonText = 'Get started';
    }
    if(index == 1 || index == 2){
      isFirstPage = false;
    } else {
      isFirstPage = true;
    }
    emit(ChangeCurrentIndexState());
  }
}