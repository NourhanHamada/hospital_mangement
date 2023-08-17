import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'create_call_state.dart';

class CreateCallCubit extends Cubit<CreateCallState> {
  CreateCallCubit() : super(CreateCallInitial());

  CreateCallCubit get(context) => BlocProvider.of(context);

  final callFormKey = GlobalKey<FormState>();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientAgeController = TextEditingController();
  TextEditingController patientPhoneNumberController = TextEditingController();
  TextEditingController selectDoctorController = TextEditingController();
  TextEditingController caseDescriptionController = TextEditingController();

  int defaultValue = 10;

  selectAge(int value){
    defaultValue = value;
    patientAgeController.text = defaultValue.toString();
    emit(SelectDateState());
  }
}
