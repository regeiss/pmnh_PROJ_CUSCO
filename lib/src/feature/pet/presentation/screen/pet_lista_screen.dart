import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/appbar.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';
import 'package:gtk_flutter/src/core/router/app_router.dart';
import 'package:gtk_flutter/src/feature/pet/data/pet_repository.dart';
import 'package:gtk_flutter/src/feature/pet/domain/pet.dart';
import 'package:gtk_flutter/src/feature/pet/presentation/controller/pet_screen_controller.dart';
import 'package:gtk_flutter/src/utils/async_value_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PetsScreen extends ConsumerWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Pets'),
        appBar: AppBar(),
        widgets: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => context.goNamed(AppRoute.addPet.name),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Consumer(
        builder: (context, ref, child) {
          ref.listen<AsyncValue>(
            petsScreenControllerProvider,
            (_, state) => state.showAlertDialogOnError(context),
          );
          final petsQuery = ref.watch(petsQueryProvider);
          return FirestoreListView<Pet>(
            query: petsQuery,
            emptyBuilder: (context) => const Center(child: Text('Não há dados para exibir')),
            errorBuilder: (context, error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
            itemBuilder: (context, doc) {
              final pet = doc.data();
              return Dismissible(
                key: Key('pet-${pet.id}'),
                background: Container(color: Colors.red),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => ref.read(petsScreenControllerProvider.notifier).deletePet(pet),
                child: PetListTile(
                  pet: pet,
                  onTap: () => context.goNamed(
                    AppRoute.editaPet.name,
                    pathParameters: {'id': pet.id},
                    extra: pet,
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

class PetListTile extends StatelessWidget {
  const PetListTile({super.key, required this.pet, this.onTap});
  final Pet pet;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        pet.imageURLString,
        fit: BoxFit.fill,
      ),
      title: Text(pet.nome),
      subtitle: Text(DateFormat('dd/MM/yyyy').format(pet.data)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
