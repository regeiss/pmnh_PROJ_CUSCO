import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/appbar.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';
//import 'package:gtk_flutter/src/constants/app_sizes.dart';
import 'package:gtk_flutter/src/core/router/app_router.dart';
import 'package:gtk_flutter/src/feature/abrigos/data/abrigo_repository.dart';
import 'package:gtk_flutter/src/feature/abrigos/domain/abrigo.dart';
import 'package:gtk_flutter/src/feature/abrigos/presentation/abrigo_screen_controller.dart';
import 'package:gtk_flutter/src/utils/async_value_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbrigosScreen extends ConsumerWidget {
  const AbrigosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var card = SizedBox(
    //   height: 150,
    //   child: Card(
    //     elevation: 1,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(1)),
    //     ),
    //     child: ListTile(
    //       dense: false,
    //       leading: FlutterLogo(),
    //       title: Text(
    //         "Abrigo tal\n #31",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //       ),
    //       subtitle: Text(
    //         "Local: Indefinida",
    //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //       ),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Abrigos'),
        appBar: AppBar(),
        widgets: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Ajustes'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
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
            emptyBuilder: (context) => const Center(child: Text('No data')),
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
                    AppRoute.abrigos.name,
                    pathParameters: {'id': abrigo.id},
                  ),
                ),
              );
            },
          );
        },
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         card,
      //         gapW4,
      //         card,
      //         gapW4,
      //         card,
      //         card,
      //         gapW4,
      //         card,
      //       ],
      //     ),
      //   ),
      // ),
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
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
