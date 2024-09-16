import 'dart:async';

import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/pet/data/pet_repository.dart';
import 'package:gtk_flutter/src/feature/pet/domain/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet_screen_controller.g.dart';

@riverpod
class PetsScreenController extends _$PetsScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deletePet(Pet pet) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('Usuário não pode ser null');
    }
    final repository = ref.read(petsRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.deletePet(uid: currentUser.uid, petId: pet.id));
  }
}