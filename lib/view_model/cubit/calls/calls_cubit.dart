import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';

part 'calls_state.dart';

class CallsCubit extends Cubit<CallsState> {
  CallsCubit() : super(CallsInitial());

  CallsCubit get(context) => BlocProvider.of(context);

  getCalls() async {
    await DioHelper.getData(
        url: '',
      token: userAccessToken,
    ).then((value) {
      debugPrint(value.data.toString());
    });
  }
}
