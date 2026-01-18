import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbars',
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animated-container',
      builder: (context, state) => AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),

    GoRoute(
      path: '/infinte-scroll',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),

    GoRoute(
      name: CounterScreen.name,
      path: '/counter',
      builder: (context, state) => CounterScreen(),
    ),
  ],
);
