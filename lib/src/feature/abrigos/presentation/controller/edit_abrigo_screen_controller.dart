import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/abrigos/data/abrigo_repository.dart';
import 'package:gtk_flutter/src/feature/abrigos/domain/abrigo.dart';
import 'package:gtk_flutter/src/feature/abrigos/presentation/abrigo_submit_exception.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_abrigo_screen_controller.g.dart';

@riverpod
class EditAbrigoScreenController extends _$EditAbrigoScreenController {
  @override
  FutureOr<void> build() {
    //
  }

  Future<bool> submit(
      {AbrigoID? abrigoId, Abrigo? oldAbrigo, required String nome, required String comentario, required Timestamp data, required bool ativo}) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('Usuário não pode ser null');
    }
    // set loading state
    state = const AsyncLoading().copyWithPrevious(state);
    // check if nome is already in use
    final repository = ref.read(abrigosRepositoryProvider);
    final abrigos = await repository.fetchAbrigos(uid: currentUser.uid);
    final allLowerCaseNames = abrigos.map((abrigo) => abrigo.nome.toLowerCase()).toList();
    // it's ok to use the same nome as the old abrigo
    if (oldAbrigo != null) {
      allLowerCaseNames.remove(oldAbrigo.nome.toLowerCase());
    }
    // check if nome is already used
    if (allLowerCaseNames.contains(nome.toLowerCase())) {
      state = AsyncError(AbrigoSubmitException(), StackTrace.current);
      return false;
    } else {
      // abrigo previously existed
      if (abrigoId != null) {
        final abrigo = Abrigo(id: abrigoId, nome: nome, comentario: comentario, ativo: ativo, data: Timestamp.fromDate(DateTime.now()));
        state = await AsyncValue.guard(
          () => repository.updateAbrigo(uid: currentUser.uid, abrigo: abrigo),
        );
      } else {
        state = await AsyncValue.guard(
          () => repository.addAbrigo(uid: currentUser.uid, nome: nome, comentario: comentario, ativo: ativo, data: data),
        );
      }
      return state.hasError == false;
    }
  }
}
