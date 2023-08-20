import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';
import 'package:hospital_mangement/view_model/database/network/end_points.dart';

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
  int currentIndex = 0;

  selectAge(int value) {
    defaultValue = value;
    patientAgeController.text = defaultValue.toString();
    emit(SelectDateState());
  }

  late int id;

  createCall({
    required String patientName,
    required String doctorId,
    required String patientAge,
    required String phone,
    required String description,
  }) async {
    emit(CreateCallLoading());
    var data = {
      'patient_name': patientName,
      'doctor_id': id,
      'age': patientAge,
      'phone': phone,
      'description': description,
    };
    await DioHelper.postData(
      url: createCallEndPoint,
      data: data,
      token: userAccessToken,
    ).then((value) {
      debugPrint(value.data.toString());
      emit(CreateCallSuccess());
    }).catchError((onError) {
      debugPrint(onError);
      emit(CreateCallFail());
    });
  }
}
