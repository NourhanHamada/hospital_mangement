import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);
  final BuildContext context;

  String specialist = 'doctor';

  doctorScreen(){
    specialist = 'doctor';
      // context.push();
    emit(DoctorState());
  }
}
