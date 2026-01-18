import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(darkModeProvider.notifier).toogleDarkMode();
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: _CounterView(counter: clickCounter),
      floatingActionButton: _FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).clickAddCounter();
        },
        icon: Icons.add,
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(icon));
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView({required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    final TextStyle? captionStyle = Theme.of(context).textTheme.titleLarge;
    return Center(child: Text('Valor: $counter', style: captionStyle));
  }
}
