import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexly_app/features/account/presentation/pages/account_page.dart';
import 'package:nexly_app/features/auth/presentation/pages/login_page.dart';
import 'package:nexly_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:nexly_app/features/history/presentation/pages/history_page.dart';
import 'package:nexly_app/features/pairing/presentation/pages/1_scan_ap_page.dart';
import 'package:nexly_app/features/schedule/presentation/pages/schedule_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorDashboardKey = GlobalKey<NavigatorState>(debugLabel: 'dashboardShell');
final GlobalKey<NavigatorState> _shellNavigatorScheduleKey = GlobalKey<NavigatorState>(debugLabel: 'scheduleShell');
final GlobalKey<NavigatorState> _shellNavigatorHistoryKey = GlobalKey<NavigatorState>(debugLabel: 'historyShell');
final GlobalKey<NavigatorState> _shellNavigatorAccountKey = GlobalKey<NavigatorState>(debugLabel: 'accountShell');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: <RouteBase>[
    GoRoute(
      path: '/auth',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: '/pairing',
      builder: (BuildContext context, GoRouterState state) => const ScanApPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDashboardKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/dashboard',
              builder: (BuildContext context, GoRouterState state) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorScheduleKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/schedule',
              builder: (BuildContext context, GoRouterState state) => const SchedulePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHistoryKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/history',
              builder: (BuildContext context, GoRouterState state) => const HistoryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAccountKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/account',
              builder: (BuildContext context, GoRouterState state) => const AccountPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_rounded),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
