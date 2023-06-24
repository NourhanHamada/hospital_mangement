import 'package:flutter/material.dart';

import '../core/scaffold_custom/background_scaffold.dart';
import '../widgets/splash_screen/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: const SplashScreenBody(),
    );
  }
}
