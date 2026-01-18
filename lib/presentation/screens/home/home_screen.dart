import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Widgets App')),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return ListTile(
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subTitle),
          leading: Icon(menuItem.icon, color: colors.primary),
          trailing: Icon(Icons.chevron_right_rounded, color: colors.primary),
          onTap: () {
            // Navigator.of(
            //   context,
            // ).push(MaterialPageRoute(builder: (context) => ButtonsScreen()));

            // Navigator.pushNamed(context, menuItem.link);

            context.push(menuItem.link);
          },
          splashColor: colors.primary,
        );
      },
    );
  }
}
