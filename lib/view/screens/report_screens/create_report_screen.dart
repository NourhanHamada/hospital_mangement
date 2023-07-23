import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view_model/cubit/report/report_cubit.dart';
import 'package:image_picker/image_picker.dart';

class CreateReportScreen extends StatefulWidget {
  const CreateReportScreen({super.key});

  @override
  State<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends State<CreateReportScreen> {
  final GlobalKey formKey = GlobalKey();
  final TextEditingController reportNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ReportCubit reportCubit = BlocProvider.of<ReportCubit>(context, listen: true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Create Report',
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: reportNameController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Report Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: grey400,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: grey400,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DottedBorder(
                    color: grey400,
                    strokeWidth: 2,
                    borderType: BorderType.Rect,
                    strokeCap: StrokeCap.butt,
                    dashPattern: const [12, 10],
                    child: SizedBox(
                      width: context.screenWidth,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: mainColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: Icon(
                                      Icons.download_rounded,
                                      color: white,
                                      size: 48,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(8, 8),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: mainColor.withOpacity(.7),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(80, 4),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: mainColor.withOpacity(.5),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(80, 88),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: mainColor.withOpacity(.7),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(4, 100),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: mainColor.withOpacity(.5),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth / 2.1,
                            child: ElevatedButton(
                              onPressed: (){
                                reportCubit.pickImageFromGallery();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: mainColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: grey200,
                                elevation: 0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: mainColor,
                                    ),
                                    CustomText(
                                      text: 'Upload Image',
                                      color: mainColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // test Image View!!!
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // selectedImage != null
                  //     ? Expanded(
                  //     child: Image.file(selectedImage!))
                  //     : CustomText(text: 'Please Select an Image'),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
          MainButton(
            title: 'Create Report',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


