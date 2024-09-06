import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/core/router/app_startup.dart';
import 'package:gtk_flutter/src/core/router/go_router_refresh_stream.dart';
import 'package:gtk_flutter/src/core/router/scaffold_with_nested_navigation.dart';
import 'package:gtk_flutter/src/core/router/views/not_found_page.dart';
import 'package:gtk_flutter/src/feature/abrigos/presentation/abrigos_screen.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/auth/presentation/custom_sign_in_screen.dart';
import 'package:gtk_flutter/src/feature/entries/presentation/entries_screen.dart';
import 'package:gtk_flutter/src/feature/home/presentation/home_screen.dart';
import 'package:gtk_flutter/src/feature/onboarding/data/onboarding_repository.dart';
import 'package:gtk_flutter/src/feature/onboarding/views/onboarding_screen.dart';
import 'package:gtk_flutter/src/feature/pets/presentation/pets_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _abrigosNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'portes');
final _accountNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'entries');
final _jobsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'jobs');
final _petsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'pets');
final _matchesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'matches');

enum AppRoute { onboarding, signIn, entry, addEntry, editEntry, abrigos, perfil, matches, pets, home }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/signIn',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
    redirect: (context, state) {
      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        return '/startup';
      }
      final onboardingRepository = ref.read(onboardingRepositoryProvider).requireValue;
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();
      final path = state.uri.path;
      if (!didCompleteOnboarding) {
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
        if (path != '/onboarding') {
          return '/onboarding';
        }
        return null;
      }
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (path.startsWith('/startup') || path.startsWith('/onboarding') || path.startsWith('/signIn')) {
          return '/home';
        }
      } else {
        if (path.startsWith('/startup') ||
            path.startsWith('/onboarding') ||
            path.startsWith('/home') ||
            path.startsWith('/entries') ||
            path.startsWith('/account')) {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            // * This is just a placeholder
            // * The loaded route will be managed by GoRouter on state change
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) => NoTransitionPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CustomSignInScreen(),
        ),
      ),
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _jobsNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _petsNavigatorKey,
            routes: [
              GoRoute(
                path: '/pets',
                name: AppRoute.pets.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PetsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _abrigosNavigatorKey,
            routes: [
              GoRoute(
                path: '/abrigos',
                name: AppRoute.abrigos.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AbrigosScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _matchesNavigatorKey,
            routes: [
              GoRoute(
                path: '/matches',
                name: AppRoute.matches.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: EntriesScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _accountNavigatorKey,
            routes: [
              GoRoute(
                path: '/account',
                name: AppRoute.perfil.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
