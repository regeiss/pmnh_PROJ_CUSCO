// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:gtk_flutter/src/feature/login/widgets/button_section.dart';
// import 'package:gtk_flutter/src/feature/login/widgets/divider_section.dart';
// import 'package:gtk_flutter/src/feature/login/widgets/email_button.dart';
// import 'package:gtk_flutter/src/feature/login/widgets/image_section.dart';
// import 'package:gtk_flutter/src/feature/login/widgets/login_section.dart';
// import 'package:gtk_flutter/src/feature/login/widgets/title_section.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../auth/providers/authentication_provider.dart';

// class LoginView extends HookConsumerWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final email = useTextEditingController();
//     // final senha = useTextEditingController();

//     ref.listen(authNotifierProvider, (previous, next) {
//       next.maybeWhen(
//         orElse: () => null,
//         authenticated: (user) {
//           GoRouter.of(context).go("/home");
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Usuário logado'),
//               behavior: SnackBarBehavior.floating,
//             ),
//           );
//         },
//         unauthenticated: (message) => ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(message!),
//             behavior: SnackBarBehavior.floating,
//           ),
//         ),
//       );
//     });

//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(height: 55),
//           ImageSection(image: 'assets/image_placeholder.png'),
//           const SizedBox(height: 10),
//           TitleSection(titulo: 'Bem vindo ao ', subtitulo: 'Aplicativo Cusco - PMNH'),
//           const SizedBox(height: 10),
//           LoginEmailButton(),
//           const SizedBox(height: 10),
//           DividerSection(),
//           const SizedBox(height: 10),
//           ButtonSection(),
//           const SizedBox(height: 10),
//           LoginSection()
//         ],
//       ),
//     );
//   }
// }
