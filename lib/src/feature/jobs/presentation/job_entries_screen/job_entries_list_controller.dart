import 'dart:async';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/entries/data/entries_repository.dart';
import 'package:gtk_flutter/src/feature/entries/domain/entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'job_entries_list_controller.g.dart';

@riverpod
class JobsEntriesListController extends _$JobsEntriesListController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deleteEntry(EntryID entryId) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(entriesRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.deleteEntry(uid: currentUser.uid, entryId: entryId));
  }
}
