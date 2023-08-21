import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/model/all_users_model.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit() : super(AllUsersInitial());

  AllUsersCubit get(context) => BlocProvider.of(context);
  TextEditingController searchForEmployeeController = TextEditingController();

  List<String> specialist = [
    'All',
    'Doctor',
    'Nurse',
    'HR',
    'Analysis',
    'Manager',
    'Receptionist'
  ];
  int currentIndex = 0;

  List<Map<String, dynamic>> data = [];
  late AllUsersModel allUsersModel;

  Future getAllUsers({required String specialist}) async {
    emit(GetAllUsersLoading());
    await DioHelper.getData(
      url: 'doctors?type=$specialist',
      // token: userAccessToken,
      token:
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTQyYWJhNGI3OTYxZjgzNDU0MzE1ODE3YzU5YTk4YzMwMDBiNGVmYTFiZDU1NzdiNDZiNWQyZWI0NWQxYmZiODk5MGIwMmUwZGI4ZDgxNWYiLCJpYXQiOjE2OTIzNjc1MzguOTc1MDc2LCJuYmYiOjE2OTIzNjc1MzguOTc1MDgzLCJleHAiOjE3MjM5ODk5MzguOTMwNTg4LCJzdWIiOiIzNDIiLCJzY29wZXMiOltdfQ.hQ6wmF-FiNqskE4IQUuiFVao4wjgnong5p-8nJ11xyA8OKn3f6pIv_h7zUvxra0ZD3zZFbwH4v1aZtUPZ_QLqZxAs_02B1Cu6_ViMHK2h_WoBF_9hzwiKYpovVS57t2Yys0hzjibAghoMouFIfhgLj_7q8rRWk0_XrpPupqOwUgWrffnCeUblZo7n33JbQuXhF1cN9SFgNAXNedqHX2SC3atskgyb-a3MG6-0T3aOcHR00wPOu9rNXSNBeIpmJ4XDN5CVHMoSXER3qFC2TubFEgpRjVLR0ngNJEml-mhwYojEt8daf-UoHgi0EBnU5IjCGs9xW5KVpPcV0spprCSmcdPyc12wBIkaqFkE3TOg6qCh0NdOlP96_XSYbKCL0-88GwSIenn0Gc1Jbl0acYLxOcyod-bjbKHMjmL8xlfEM9d4G7b6tPuO1TNYPc-Nm52K24siNA8PwFE14_wYTe6K8eHC_e3I26eI2z40S4m9cGB_FjMz-oZqEsR_8o4Pi6dEFi8d7DRNkHyXCpGyRt_UpBvuAyfmxUmGDEIAZfPyKYSomxD9-4TOJ3XXwtIBOBT_az35y_I8Ea0FgMKVVLcsn5r64SbJ1JRFWrx-8Kwvmp8cAQJ6kVvm2ZI-W57skOk83lR8111-JIIo4yTvooQ4tZaPukgGDK9wXxG15Uf_g8',
    ).then((value) async {
      allUsersModel = AllUsersModel.fromJson(value.data);

      final finalData = value.data['data'];
      data = List<Map<String, dynamic>>.from(finalData);
      emit(GetAllUsersSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetAllUsersFail());
    });
  }

  List<Map<String, dynamic>> filteredData = [];

  void performSearch(String query) {
    if (query.isEmpty) {
      filteredData = [];
    } else {
      filteredData = data
          .where((item) =>
              item['first_name'].toLowerCase().contains(query.toLowerCase())
              //     ||
              // item['type'].toLowerCase().contains(query.toLowerCase())
      )
          .toList();
    }
    emit(FilterSearchData());
  }
}
