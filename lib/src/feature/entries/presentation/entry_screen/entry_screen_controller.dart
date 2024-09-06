import 'dart:async';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/entries/data/entries_repository.dart';
import 'package:gtk_flutter/src/feature/entries/domain/entry.dart';
import 'package:gtk_flutter/src/feature/jobs/domain/job.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entry_screen_controller.g.dart';

@riverpod
class EntryScreenController extends _$EntryScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<bool> submit({
    EntryID? entryId,
    required JobID jobId,
    required DateTime start,
    required DateTime end,
    required String comment,
  }) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(entriesRepositoryProvider);
    state = const AsyncLoading();
    if (entryId == null) {
      state = await AsyncValue.guard(() => repository.addEntry(
            uid: currentUser.uid,
            jobId: jobId,
            start: start,
            end: end,
            comment: comment,
          ));
    } else {
      final entry = Entry(
        id: entryId,
        jobId: jobId,
        start: start,
        end: end,
        comment: comment,
      );
      state = await AsyncValue.guard(() => repository.updateEntry(uid: currentUser.uid, entry: entry));
    }
    return state.hasError == false;
  }
}
