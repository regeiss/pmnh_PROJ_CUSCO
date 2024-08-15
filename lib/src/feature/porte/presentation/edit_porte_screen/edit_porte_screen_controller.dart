import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/porte/data/porte_repository.dart';
import 'package:gtk_flutter/src/feature/porte/domain/porte.dart';
import 'package:gtk_flutter/src/feature/porte/presentation/edit_porte_screen/job_submit_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_porte_screen_controller.g.dart';

@riverpod
class EditPorteScreenController extends _$EditPorteScreenController {
  @override
  FutureOr<void> build() {
    //
  }

  Future<bool> submit({PorteID? porteId, Porte? oldPorte, required String descricao, required Timestamp dataCriacao}) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('Usuário não pode ser null');
    }
    // set loading state
    state = const AsyncLoading().copyWithPrevious(state);
    // check if name is already in use
    final repository = ref.read(portesRepositoryProvider);
    final portes = await repository.fetchPortes(uid: currentUser.uid);
    final allLowerCaseNames = portes.map((porte) => porte.descricao.toLowerCase()).toList();
    // it's ok to use the same name as the old porte
    if (oldPorte != null) {
      allLowerCaseNames.remove(oldPorte.descricao.toLowerCase());
    }
    // check if name is already used
    if (allLowerCaseNames.contains(descricao.toLowerCase())) {
      state = AsyncError(JobSubmitException(), StackTrace.current);
      return false;
    } else {
      // job previously existed
      if (porteId != null) {
        final porte = Porte(id: porteId, descricao: descricao, dataCriacao: dataCriacao);
        state = await AsyncValue.guard(
          () => repository.updatePorte(uid: currentUser.uid, porte: porte),
        );
      } else {
        state = await AsyncValue.guard(
          () => repository.addPorte(uid: currentUser.uid, descricao: descricao, dataCriacao: dataCriacao),
        );
      }
      return state.hasError == false;
    }
  }
}
