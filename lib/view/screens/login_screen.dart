import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/background_scaffold.dart';
import '../widgets/login_screen/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BackgroundScaffold(
      body: const LoginScreenBody(),
    );
  }
}
