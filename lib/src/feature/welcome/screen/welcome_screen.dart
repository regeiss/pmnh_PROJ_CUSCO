import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/feature/login/views/button_section.dart';
import 'package:gtk_flutter/src/feature/login/views/divider_section.dart';
import 'package:gtk_flutter/src/feature/login/views/email_button.dart';
import 'package:gtk_flutter/src/feature/login/views/image_section.dart';
import 'package:gtk_flutter/src/feature/login/views/login_section.dart';
import 'package:gtk_flutter/src/feature/login/views/title_section.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../auth/providers/authentication_provider.dart';

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final email = useTextEditingController();
    // final senha = useTextEditingController();

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          GoRouter.of(context).go("/home");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário logado'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        unauthenticated: (message) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message!), behavior: SnackBarBehavior.floating,),
        ),
      );
    });

    return Scaffold(
      body: Container(
        child: Column( children: [ 
          const SizedBox(height: 55),
          ImageSection(image: 'assets/adocao.jpg'),
          const SizedBox(height: 10),
          TitleSection(titulo: 'Bem vindo ao ', subtitulo: 'Aplicativo Cusco - PMNH'),
          const SizedBox(height: 10),
          LoginEmailButton(),
          const SizedBox(height: 10),          
          DividerSection(),
          const SizedBox(height: 10),
          ButtonSection(),
          const SizedBox(height: 10),
          LoginSection()],
        ),
      )
    );
  }
}
