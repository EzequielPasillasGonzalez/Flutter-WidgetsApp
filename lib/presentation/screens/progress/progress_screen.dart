import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
        spacing: 30,
        children: [
          Text('Circular Progress Indicator'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          Text('Circular y Linear Progress Indicator Controlado'),
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, asyncSnapshot) {
        final progressValue = asyncSnapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: progressValue,
                backgroundColor: Colors.black45,
              ),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
            ],
          ),
        );
      },
    );
  }
}
