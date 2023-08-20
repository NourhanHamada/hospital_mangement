import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/widgets/home_screen/select_nurse_item.dart';
import 'package:hospital_mangement/view_model/cubit/all_users/all_users_cubit.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:paginated_search_bar/paginated_search_bar_state_property.dart';

import '../../../view_model/cubit/create_call/create_call_cubit.dart';
import '../../core/custom_appbar.dart';

class SelectDoctorScreen extends StatefulWidget {
  const SelectDoctorScreen({super.key});

  @override
  State<SelectDoctorScreen> createState() => _SelectDoctorScreenState();
}

class _SelectDoctorScreenState extends State<SelectDoctorScreen> {
  var searchValue = '';
  // List<String> doctors = AllUsersCubit().doctors;
  List<String> doctors = ['rami', 'ahmed'];

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
                  },
                  decoration: BoxDecoration(
                    border: Border.all(color: grey400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(12),
                  itemColor: black,
                  itemSize: 24,
                  placeholder: 'Search for doctor',

                ),
                // DropdownButtonFormField2<String>(
                //   // value:
                //   //     createCallCubit.selectDoctorController.text.isNotEmpty
                //   //         ? createCallCubit.selectDoctorController.text
                //   //         : null,
                //   isExpanded: true,
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(
                //       Icons.search,
                //       color: grey700,
                //       size: 30,
                //     ),
                //     fillColor: white,
                //     filled: true,
                //     isDense: true,
                //     errorStyle: const TextStyle(
                //         color: orangeRed,
                //         fontSize: 12,
                //         fontWeight: FontWeight.w500),
                //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                //     border: OutlineInputBorder(
                //       borderSide: const BorderSide(
                //         color: grey400,
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(
                //         10,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: mainColor,
                //           width: 2,
                //         ),
                //         borderRadius: BorderRadius.circular(10)),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: const BorderSide(
                //         color: grey400,
                //       ),
                //     ),
                //     contentPadding: const EdgeInsets.symmetric(
                //       vertical: 10,
                //       horizontal: 16,
                //     ),
                //     errorBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Colors.red,
                //           // color: Colors.transparent,
                //         ),
                //         borderRadius: BorderRadius.circular(10)),
                //     focusedErrorBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Colors.red,
                //           // color: Colors.transparent,
                //         ),
                //         borderRadius: BorderRadius.circular(10)),
                //   ),
                //   hint: const Text(
                //     'Search for doctors',
                //     style: TextStyle(
                //       fontSize: 15,
                //       color: grey800,
                //     ),
                //   ),
                //   style: const TextStyle(color: darkBackground),
                //   items: doctors
                //       .map(
                //         (item) => DropdownMenuItem<String>(
                //           value: item,
                //           child: Text(
                //             item,
                //             style: const TextStyle(
                //               fontSize: 14,
                //             ),
                //           ),
                //         ),
                //       )
                //       .toList(),
                //   onChanged: (value) {
                //     createCallCubit.selectDoctorController.text =
                //         value!.toString();
                //   },
                //   onSaved: (value) {
                //     // selectedValue = value.toString();
                //     // userInsertedField = value!.toString();
                //   },
                //   buttonStyleData: const ButtonStyleData(
                //       // padding: EdgeInsets.only(right: 8),
                //       ),
                //   iconStyleData: const IconStyleData(
                //     icon: Icon(
                //       Icons.arrow_drop_down,
                //       color: grey600,
                //     ),
                //     iconSize: 24,
                //   ),
                //   dropdownStyleData: DropdownStyleData(
                //     maxHeight: context.screenHeight / 4,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: white,
                //     ),
                //   ),
                //   menuItemStyleData: const MenuItemStyleData(
                //     padding: EdgeInsets.only(left: 8),
                //   ),
                // ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  // height: context.screenHeight / 2,
                  child: ListView.builder(
                    itemCount: allUsersCubit.allUsersModel.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        createCallCubit.id = allUsersCubit.allUsersModel.data![index].id!;
                        createCallCubit.selectDoctorController.text = allUsersCubit.allUsersModel.data![index].firstName!;
                        setState(() {
                          createCallCubit.currentIndex = index;
                        });
                      },
                      child: Card(
                        elevation: 0,
                        child: SelectNurseItem(
                            activeOrNot: greenCard,
                            selected: createCallCubit.currentIndex == index ? mainColor : grey300,
                            name: allUsersCubit.allUsersModel.data![index].firstName.toString(),
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
