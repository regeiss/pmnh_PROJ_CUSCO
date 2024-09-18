import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/pet/data/pet_repository.dart';
import 'package:gtk_flutter/src/feature/pet/domain/pet.dart';
import 'package:gtk_flutter/src/feature/pet/presentation/controller/pet_submit_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edita_pet_screen_controller.g.dart';

@riverpod
class EditPetScreenController extends _$EditPetScreenController {
  @override
  FutureOr<void> build() {
    //
  }

  Future<bool> submit(
      {PetID? petId,
      Pet? oldPet,
      required String nome,
      required String comentario,
      required DateTime data,
      required bool ativo,
      required String imageURLString}) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('Usuário não pode ser null');
    }
    // seta loading state
    state = const AsyncLoading().copyWithPrevious(state);
    //
    final repository = ref.read(petsRepositoryProvider);
    final pets = await repository.fetchPets(uid: currentUser.uid);
    final allLowerCaseNames = pets.map((pet) => pet.nome.toLowerCase()).toList();
    //
    if (oldPet != null) {
      allLowerCaseNames.remove(oldPet.nome.toLowerCase());
    }
    //
    if (allLowerCaseNames.contains(nome.toLowerCase())) {
      state = AsyncError(PetSubmitException(), StackTrace.current);
      return false;
    } else {
      //
      if (petId != null) {
        final pet = Pet(id: petId, nome: nome, comentario: comentario, ativo: ativo, data: data, imageURLString: imageURLString);
        state = await AsyncValue.guard(
          () => repository.updatePet(uid: currentUser.uid, pet: pet),
        );
      } else {
        state = await AsyncValue.guard(
          () => repository.addPet(uid: currentUser.uid, nome: nome, comentario: comentario, ativo: ativo, data: data, imageURLString: imageURLString),
        );
      }
      return state.hasError == false;
    }
  }
}
