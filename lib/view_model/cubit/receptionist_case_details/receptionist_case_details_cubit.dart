import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'receptionist_case_details_state.dart';

class ReceptionistCaseDetailsCubit extends Cubit<ReceptionistCaseDetailsState> {
  ReceptionistCaseDetailsCubit() : super(ReceptionistCaseDetailsInitial());

  ReceptionistCaseDetailsCubit get(context) => BlocProvider.of(context);

  bool isLogOut = false;
  bool isFinished = false;

  logout(BuildContext context){
    isLogOut = true;
    isFinished = true;
    Future.delayed(const Duration(seconds: 2), (){
      // context.push();
    });
    emit(LogoutState());
  }
}
