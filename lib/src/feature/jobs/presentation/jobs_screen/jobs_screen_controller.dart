import 'dart:async';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/jobs/data/jobs_repository.dart';
import 'package:gtk_flutter/src/feature/jobs/domain/job.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jobs_screen_controller.g.dart';

@riverpod
class JobsScreenController extends _$JobsScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deleteJob(Job job) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(jobsRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.deleteJob(uid: currentUser.uid, jobId: job.id));
  }
}
