import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view_model/cubit/all_users/all_users_cubit.dart';
import '../../core/scaffold_custom/scaffold_custom.dart';
import 'new_user_screen.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllUsersCubit allUsersCubit =
        BlocProvider.of<AllUsersCubit>(context, listen: true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Employee',
      ),
      body: BlocConsumer<AllUsersCubit, AllUsersState>(
        listener: (context, state) {
          // if (state is GetAllUsersLoading) {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return const Center(
          //         child: CircularProgressIndicator(
          //           color: mainColor,
          //         ),
          //       );
          //     },
          //   );
          // }
          // if (state is GetAllUsersSuccess) {
          //   context.pop();
          // }
          // if (state is GetAllUsersFail) {
          //   context.pop();
          // }
        },
        builder: (context, state) {
          return Column(
            children: [
              TextFormField(
                controller: allUsersCubit.searchForEmployeeController,
                onTap: (){},
                onChanged: (value){
                  allUsersCubit.searchForEmployeeController.text = value;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: grey500,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: grey600)
                  ),
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search, color: black,),
                  hintText: 'Search for Employee',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allUsersCubit.specialist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            allUsersCubit.getAllUsers(
                                specialist: allUsersCubit.specialist[index]);
                            allUsersCubit.currentIndex = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: allUsersCubit.currentIndex == index
                                    ? mainColor
                                    : Colors.transparent,
                                border: Border.all(
                                  color: allUsersCubit.currentIndex == index
                                      ? Colors.transparent
                                      : grey400,
                                ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Center(
                              child: CustomText(
                                text: allUsersCubit.specialist[index],
                                color: allUsersCubit.currentIndex == index
                                    ? white
                                    : black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 15,
                child: ListView.builder(
                  itemCount: allUsersCubit.allUsersModel.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(5),),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: CustomText(
                                    text: allUsersCubit
                                        .allUsersModel.data![index].firstName
                                        .toString(),
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                CustomText(
                                  text:
                                      'Specialist - ${allUsersCubit.allUsersModel.data![index].type.toString()}',
                                  color: grey600,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          context.push(const NewUserScreen());
          // allUsersCubit.getAllUsers();
        },
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: white,
          size: 32,
        ),
      ),
    );
  }
}
