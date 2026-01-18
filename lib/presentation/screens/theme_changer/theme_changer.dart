import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
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

      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorThemeProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioGroup(
          onChanged: (val) => onChanged?.call(val!),
          groupValue: selectedTransportation,
          child: Column(
            children: [
              RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
              ),
              RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar por barco'),
                value: Transportation.boat,
              ),
              RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar por avión'),
                value: Transportation.plane,
              ),
              RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Viajar por submarino'),
                value: Transportation.submarine,
              ),
            ],
          ),
        ),
      },
    );
  }
}
