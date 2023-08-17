import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);
  final BuildContext context;

  String specialist = 'doctor';

  List<String> jobs = [
    'Doctor',
    'Receptionist',
    'Nurse',
    'Analyst Employee',
    'Manager',
    'HR',
  ];
}
