import 'package:flutter/material.dart';

import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 14.0, end: 16.0).animate(_controller);
    _animation.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomText(
          text: 'Loading ...',
          fontSize: _animation.value,
          color: mainColor,
        );
      },
    );
  }
}
