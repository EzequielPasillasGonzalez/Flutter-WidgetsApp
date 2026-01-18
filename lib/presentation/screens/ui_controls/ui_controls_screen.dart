import 'package:flutter/material.dart';

enum Transportation { car, plane, boat, submarine }

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls Screen')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicinales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        _ExpasionTitle(
          selectedTransportation,
          onChanged: (Transportation value) {
            setState(() {
              selectedTransportation = value;
            });
          },
        ),

        _CheckboxListTile(
          title: '¿Desayuno?',
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = value ?? !wantsBreakfast;
          }),
        ),

        _CheckboxListTile(
          title: '¿Almuerzo?',
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = value ?? !wantsLunch;
          }),
        ),

        _CheckboxListTile(
          title: '¿Cena?',
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = value ?? !wantsDinner;
          }),
        ),
      ],
    );
  }
}

class _ExpasionTitle extends StatelessWidget {
  final Transportation selectedTransportation;
  final ValueChanged<Transportation>? onChanged;

  const _ExpasionTitle(this.selectedTransportation, {this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Vehículo de transporte'),
      subtitle: Text('$selectedTransportation'),
      children: [
        RadioGroup(
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
      ],
    );
  }
}

class _CheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const _CheckboxListTile({
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
