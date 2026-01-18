import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar & Dialogs')),
      floatingActionButton: _FloatingActionButton(),
      body: _SnackbarScreen(),
    );
  }
}

class _SnackbarScreen extends StatelessWidget {
  const _SnackbarScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          FilledButton(
            onPressed: () => showAboutDialog(
              context: context,
              children: [
                const Text(
                  'Cillum adipisicing excepteur in minim tempor. Duis nulla laborum sit occaecat minim veniam sint voluptate ea non consequat do anim. Laborum laboris pariatur cupidatat consectetur aute. Sint cillum nostrud enim sit ullamco voluptate id mollit. Tempor in officia eiusmod anim in veniam minim dolore Lorem sit velit ut est. Amet quis occaecat amet exercitation ad incididunt ullamco proident cillum ipsum ad tempor. Velit consequat cillum eiusmod irure ea do consectetur ex enim esse irure elit laborum consectetur.',
                ),
              ],
            ),

            child: const Text('Licencias usadas'),
          ),
          FilledButton(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar Dialogo'),
          ),
        ],
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => showCustomSnackbar(context),

      label: const Text('Show Snackbar'),
      icon: const Icon(Icons.remove_red_eye_rounded),
    );
  }
}

void showCustomSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(
    content: const Text('Holi'),
    action: SnackBarAction(label: 'Ok!', onPressed: () {}),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void openDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('¿Estás seguro?'),
      content: const Text(
        'Mollit fugiat ea quis duis reprehenderit fugiat. Eu consectetur dolore cillum adipisicing irure. Qui veniam nisi nisi aliqua minim. Non fugiat qui qui aute laboris ex in elit culpa dolore eu laborum. Labore et magna amet Lorem id. Irure ad aute consequat eiusmod nostrud duis ut Lorem eu cupidatat cupidatat sit. Incididunt culpa consectetur cillum laboris minim excepteur cillum duis culpa qui dolore.',
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Aceptar'),
        ),
      ],
    ),
  );
}
