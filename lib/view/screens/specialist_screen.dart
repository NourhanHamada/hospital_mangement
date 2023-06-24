import 'package:flutter/material.dart';
import '../widgets/specialist_screen/specialist_screen_body.dart';

class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpecialistScreenBody(),
    );
  }
}