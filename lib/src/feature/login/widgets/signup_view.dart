// import 'package:flutter/material.dart';
// import 'package:gtk_flutter/src/core/router/routes.dart';
// // import 'package:gtk_flutter/src/feature/auth/screens/login/views/email_button.dart';
// import '../../../common_widgets/custom_button.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';

// class SignupView extends HookConsumerWidget {
//   const SignupView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.listen(authNotifierProvider, (previous, next) {
//       next.maybeWhen(
//         orElse: () => null,
//         authenticated: (user) {
//           // Navigate to any screen
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Usuário autenticado'),
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

//     final email = useTextEditingController();
//     final password = useTextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Cadastre-se')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: email,
//                 decoration: const InputDecoration(hintText: 'Email'),
//               ),
//               const SizedBox(height: 30),
//               TextField(
//                 controller: password,
//                 obscureText: true,
//                 decoration: const InputDecoration(hintText: 'Senha'),
//               ),
//               const SizedBox(height: 40),
//               Center(
//                 child: CustomButton(
//                   title: 'Signup',
//                   isDisabled: false,
//                   onPressed: () => ref.read(authNotifierProvider.notifier).signup(
//                         email: email.text,
//                         password: password.text,
//                       ),
//                   loading: ref.watch(authNotifierProvider).maybeWhen(
//                         orElse: () => false,
//                         loading: () => true,
//                       ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: CustomButton(backgroundColor: Colors.black, title: 'Cancelar', isDisabled: false, onPressed: () => context.go(Routes.login)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
