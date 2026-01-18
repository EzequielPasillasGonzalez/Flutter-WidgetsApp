import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),

            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Button Disabled'),
            ),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Button Icon'),
            ),

            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new_rounded),
              label: const Text('Filled Button Icon'),
            ),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.terminal_rounded),
              label: const Text('Outlined Button Icon'),
            ),

            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet),
              label: const Text('Text Button Icon'),
            ),

            // TODO: Custom Button
            CustomButton(),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              style: IconButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Holi', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
