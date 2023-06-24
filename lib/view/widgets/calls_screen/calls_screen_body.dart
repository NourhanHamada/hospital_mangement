import 'package:flutter/material.dart';
import '../../utils/custom_app_bar.dart';

class CallsScreenBody extends StatelessWidget {
  const CallsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: const [
          CustomAppBar(title: 'Calls'),

        ],
      ),
    );
  }
}

class CallsCard extends StatelessWidget {
  const CallsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}


