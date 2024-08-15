import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/core/router/views/not_found_page.dart';

class Routes {
  static const home = '/home';
  static const loginEmail = '/login_email';
  static const loginGoogle = '/login_google';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const profile = '/profile';
  static const profileDetails = 'details';
  static const settings = '/settings';
  static Widget errorWidget(BuildContext context, GoRouterState state) => const NotFoundScreen();
}
