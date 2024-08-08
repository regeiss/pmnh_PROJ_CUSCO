import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/core/router/views/not_found_page.dart';
import 'package:gtk_flutter/src/feature/home/view/home_view_bottom_bar.dart';
import 'package:gtk_flutter/src/feature/login/views/login_view.dart';
import 'package:gtk_flutter/src/feature/onboarding/views/onboarding_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../src/feature/onboarding/provider/onboarding_provider.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    final isOnboardingCompleted = ref.watch(onboardingNotifierProvider);
    final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
    final GlobalKey<NavigatorState> sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

    return GoRouter(
      initialLocation: isOnboardingCompleted ? '/login' : '/onboarding',
      navigatorKey: rootNavigatorKey,
      routes: <RouteBase>[
        GoRoute(
          name: 'login', // Optional, add name to your routes. Allows you navigate by name instead of path
          path: '/login',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, state) => OnboardingScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return HomeViewBottomBar(navigationShell: navigationShell);
          },
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

            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
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

            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
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
