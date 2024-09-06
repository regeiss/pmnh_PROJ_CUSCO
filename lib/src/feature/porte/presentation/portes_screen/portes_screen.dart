// import 'package:flutter/material.dart';
// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:gtk_flutter/src/constants/strings.dart';
// import 'package:gtk_flutter/src/core/router/app_router.dart';
// import 'package:gtk_flutter/src/feature/porte/data/porte_repository.dart';
// import 'package:gtk_flutter/src/feature/porte/domain/porte.dart';
// import 'package:gtk_flutter/src/feature/porte/presentation/portes_screen/portes_screen_controller.dart';
// import 'package:gtk_flutter/src/utils/async_value_ui.dart';

// class PorteScreen extends StatelessWidget {
//   const PorteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(Strings.portes),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add, color: Colors.white),
//             onPressed: () => context.goNamed(AppRoute.addPorte.name),
//           ),
//         ],
//       ),
//       body: Consumer(
//         builder: (context, ref, child) {
//           ref.listen<AsyncValue>(
//             portesScreenControllerProvider,
//             (_, state) => state.showAlertDialogOnError(context),
//           );
//           final portesQuery = ref.watch(portesQueryProvider);
//           return FirestoreListView<Porte>(
//             query: portesQuery,
//             emptyBuilder: (context) => const Center(child: Text('Não há dados para exibir')),
//             errorBuilder: (context, error, stackTrace) => Center(
//               child: Text(error.toString()),
//             ),
//             loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
//             itemBuilder: (context, doc) {
//               final porte = doc.data();
//               return Dismissible(
//                 key: Key('porte-${porte.id}'),
//                 background: Container(color: Colors.red),
//                 direction: DismissDirection.endToStart,
//                 onDismissed: (direction) => ref.read(portesScreenControllerProvider.notifier).deletePorte(porte),
//                 child: PorteListTile(
//                   porte: porte,
//                   onTap: () => context.goNamed(
//                     AppRoute.editPorte.name,
//                     pathParameters: {'id': porte.id},
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class PorteListTile extends StatelessWidget {
//   const PorteListTile({super.key, required this.porte, this.onTap});
//   final Porte porte;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(porte.descricao),
//       trailing: const Icon(Icons.chevron_right),
//       onTap: onTap,
//     );
//   }
// }
