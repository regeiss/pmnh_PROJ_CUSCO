import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/appbar.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';
import 'package:gtk_flutter/src/core/router/app_router.dart';
import 'package:gtk_flutter/src/feature/abrigo/data/abrigo_repository.dart';
import 'package:gtk_flutter/src/feature/abrigo/domain/abrigo.dart';
import 'package:gtk_flutter/src/feature/abrigo/presentation/controller/abrigo_screen_controller.dart';
import 'package:gtk_flutter/src/utils/async_value_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AbrigosScreen extends ConsumerWidget {
  const AbrigosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Abrigos'),
        appBar: AppBar(),
        widgets: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => context.goNamed(AppRoute.addAbrigo.name),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Consumer(
        builder: (context, ref, child) {
          ref.listen<AsyncValue>(
            abrigosScreenControllerProvider,
            (_, state) => state.showAlertDialogOnError(context),
          );
          final abrigosQuery = ref.watch(abrigosQueryProvider);
          return FirestoreListView<Abrigo>(
            query: abrigosQuery,
            emptyBuilder: (context) => const Center(child: Text('Não há dados para exibir')),
            errorBuilder: (context, error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
            itemBuilder: (context, doc) {
              final abrigo = doc.data();
              return Dismissible(
                key: Key('abrigo-${abrigo.id}'),
                background: Container(color: Colors.red),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => ref.read(abrigosScreenControllerProvider.notifier).deleteAbrigo(abrigo),
                child: AbrigoListTile(
                  abrigo: abrigo,
                  onTap: () => context.goNamed(
                    AppRoute.editaAbrigo.name,
                    pathParameters: {'id': abrigo.id},
                    extra: abrigo,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void handleClick(String value) {}
}

class AbrigoListTile extends StatelessWidget {
  const AbrigoListTile({super.key, required this.abrigo, this.onTap});
  final Abrigo abrigo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(abrigo.nome),
      subtitle: Text(DateFormat('dd/MM/yyyy').format(abrigo.data.toDate())),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
