import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // * Para saber si tiene notch el telefono
    final bool hastNotch = MediaQuery.of(context).viewPadding.top > 35;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        navDrawerIndex = value;
        setState(() {});

        final menuItem = appMenuItems[value];

        context.push(menuItem.link);

        widget.scaffoldKey.currentState?.closeDrawer();
      },

      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hastNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
            .sublist(0, 3) // * Mostrar solo los primeros 3 elementos
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Divider(color: colors.primary),
        ),

        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, 10, 16, 10),
          child: const Text('More Options'),
        ),

        ...appMenuItems
            .sublist(3) // * Mostrar los elementos restantes
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
