import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

final appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter',
    subTitle: 'Counter + Riverpod',
    link: '/counter',
    icon: Icons.add,
  ),

  MenuItem(
    title: 'Botones',
    subTitle: 'Varios tipos de botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),

  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y Controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),

  MenuItem(
    title: 'Snackbars & Dialogs',
    subTitle: 'Indicators on screen',
    link: '/snackbars',
    icon: Icons.info_rounded,
  ),

  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful Widget animado',
    link: '/animated-container',
    icon: Icons.check_box_rounded,
  ),

  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),

  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial de la app',
    link: '/tutorial',
    icon: Icons.accessibility_new_rounded,
  ),

  MenuItem(
    title: 'InfiniteScroll & Pull',
    subTitle: 'InfiniteScroll and Pull to refresh',
    link: '/infinte-scroll',
    icon: Icons.list_alt_rounded,
  ),

  MenuItem(
    title: 'Themee Changer',
    subTitle: "Change app's theme",
    link: '/theme-changer',
    icon: Icons.color_lens_rounded,
  ),
];
