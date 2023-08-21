import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/widgets/home_screen/select_nurse_item.dart';
import 'package:hospital_mangement/view_model/cubit/all_users/all_users_cubit.dart';

import '../../../view_model/cubit/create_call/create_call_cubit.dart';
import '../../core/custom_appbar.dart';

class SelectDoctorScreen extends StatefulWidget {
  const SelectDoctorScreen({super.key});

  @override
  State<SelectDoctorScreen> createState() => _SelectDoctorScreenState();
}

class _SelectDoctorScreenState extends State<SelectDoctorScreen> {

  @override
  Widget build(BuildContext context) {
    CreateCallCubit createCallCubit = BlocProvider.of(
      context,
      listen: true,
    );
    AllUsersCubit allUsersCubit = BlocProvider.of(context, listen:  true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Select Doctor',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                CupertinoSearchTextField(
                  controller: createCallCubit.selectDoctorController,
                  onChanged: (value){
                    createCallCubit.selectDoctorController.text = value;
                    allUsersCubit.performSearch(value);
                  },
                  // onChanged: allUsersCubit.performSearch,
                  decoration: BoxDecoration(
                    border: Border.all(color: grey400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(12),
                  itemColor: black,
                  itemSize: 24,
                  placeholder: 'Search for doctor',

                ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allUsersCubit.filteredData.isNotEmpty ? allUsersCubit.filteredData.length : allUsersCubit.allUsersModel.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        if(allUsersCubit.filteredData.isNotEmpty) {
                          createCallCubit.id = allUsersCubit.filteredData[index]['id']!;
                          createCallCubit.selectDoctorController.text = allUsersCubit.filteredData[index]['first_name']!;
                        } else {
                          createCallCubit.id = allUsersCubit.allUsersModel.data![index].id!;
                          createCallCubit.selectDoctorController.text = allUsersCubit.allUsersModel.data![index].firstName!;
                        }
                        setState(() {
                          createCallCubit.currentIndex = index;
                        });
                      },
                      child: Card(
                        elevation: 0,
                        child: SelectNurseItem(
                            activeOrNot: greenCard,
                            selected: createCallCubit.currentIndex == index ? mainColor : grey300,
                            name: allUsersCubit.filteredData.isNotEmpty ? allUsersCubit.filteredData[index]['first_name'] : allUsersCubit.allUsersModel.data![index].firstName.toString(),
                            specialist: allUsersCubit.allUsersModel.data![index].type.toString(),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          MainButton(
            title: 'Select Doctor',
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
