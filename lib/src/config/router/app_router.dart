import 'package:go_router/go_router.dart';
import '../../ui/ui.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/happy/username/:username/lastName/:lastName',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        final lastName = state.pathParameters['lastName']!;

        return RecordScreen(
          username: username,
          lastName: lastName,
        );
      },
    ),
    // GoRoute(
    //   path: '/buttons',
    //   builder: (context, state) => const ButtonsScreen(),
    // ),
  ],
);
