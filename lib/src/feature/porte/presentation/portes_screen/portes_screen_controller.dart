import 'dart:async';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/porte/data/porte_repository.dart';
import 'package:gtk_flutter/src/feature/porte/domain/porte.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'portes_screen_controller.g.dart';

@riverpod
class PortesScreenController extends _$PortesScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deletePorte(Porte porte) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(portesRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.deletePorte(uid: currentUser.uid, porteId: porte.id));
  }
}
