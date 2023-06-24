import 'package:flutter/material.dart';

import '../constant/assets.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              up,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                down,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
