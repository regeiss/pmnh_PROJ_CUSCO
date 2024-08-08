import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/core/router/views/not_found_page.dart';
import 'package:gtk_flutter/src/feature/home/screen/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../src/feature/onboarding/provider/onboarding_provider.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    final isOnboardingCompleted = ref.watch(onboardingNotifierProvider);
    final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
    final GlobalKey<NavigatorState> sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
    return GoRouter(
      initialLocation: isOnboardingCompleted ? '/home' : '/onboarding',
      navigatorKey: rootNavigatorKey,
      routes: <RouteBase>[
        // #docregion configuration-builder
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            // Return the widget that implements the custom shell (in this case
            // using a BottomNavigationBar). The StatefulNavigationShell is passed
            // to be able access the state of the shell and to navigate to other
            // branches in a stateful way.
            return HomeScreen(navigationShell: navigationShell);
          },
          // #enddocregion configuration-builder
          // #docregion configuration-branches
          branches: <StatefulShellBranch>[
            // The route branch for the first tab of the bottom navigation bar.
            StatefulShellBranch(
              navigatorKey: sectionANavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: '/home',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(label: 'A', detailsPath: '/a/details'),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => const DetailsScreen(label: 'A'),
                    ),
                  ],
                ),
              ],
            ),
            // #enddocregion configuration-branches

            // The route branch for the second tab of the bottom navigation bar.
            StatefulShellBranch(
              // It's not necessary to provide a navigatorKey if it isn't also
              // needed elsewhere. If not provided, a default key will be used.
              routes: <RouteBase>[
                GoRoute(
                  // The screen to display as the root in the second tab of the
                  // bottom navigation bar.
                  path: '/b',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'B',
                    detailsPath: '/b/details/1',
                    secondDetailsPath: '/b/details/2',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details/:param',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'B',
                        param: state.pathParameters['param'],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // The route branch for the third tab of the bottom navigation bar.
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  // The screen to display as the root in the third tab of the
                  // bottom navigation bar.
                  path: '/c',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'C',
                    detailsPath: '/c/details',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'C',
                        extra: state.extra,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  // The screen to display as the root in the third tab of the
                  // bottom navigation bar.
                  path: '/d',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'D',
                    detailsPath: '/c/details',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'D',
                        extra: state.extra,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  // The screen to display as the root in the third tab of the
                  // bottom navigation bar.
                  path: '/e',
                  builder: (BuildContext context, GoRouterState state) => const RootScreen(
                    label: 'E',
                    detailsPath: '/c/details',
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) => DetailsScreen(
                        label: 'E',
                        extra: state.extra,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => NotFoundScreen(),
    );
  }
}
