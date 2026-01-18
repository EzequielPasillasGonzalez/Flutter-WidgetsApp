import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;
  final random = Random();

  void changeShape() {
    width = random.nextInt(300).toDouble() + 70;
    height = random.nextInt(300).toDouble() + 70;
    color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    borderRadius = random.nextInt(100).toDouble() + 70;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container Screen')),
      floatingActionButton: _FloatingActionButton(changeShape),
      body: _AnimatedBox(
        width: width,
        height: height,
        color: color,
        borderRadius: borderRadius,
      ),
    );
  }
}

class _AnimatedBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  const _AnimatedBox({
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeOutCubic,
        width: width <= 0 ? 50 : width,
        height: height <= 0 ? 50 : height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            borderRadius <= 0 ? 10 : borderRadius,
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _FloatingActionButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.play_circle_fill),
    );
  }
}
