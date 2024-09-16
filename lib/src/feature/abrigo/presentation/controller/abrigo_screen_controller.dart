import 'package:gtk_flutter/src/feature/abrigo/data/abrigo_repository.dart';
import 'package:gtk_flutter/src/feature/abrigo/domain/abrigo.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'abrigo_screen_controller.g.dart';

@riverpod
class AbrigosScreenController extends _$AbrigosScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deleteAbrigo(Abrigo abrigo) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(abrigosRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.deleteAbrigo(uid: currentUser.uid, abrigoId: abrigo.id));
  }
}
