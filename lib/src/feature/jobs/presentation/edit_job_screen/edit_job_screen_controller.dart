import 'dart:async';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/jobs/data/jobs_repository.dart';
import 'package:gtk_flutter/src/feature/jobs/domain/job.dart';
import 'package:gtk_flutter/src/feature/porte/presentation/edit_porte_screen/job_submit_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_job_screen_controller.g.dart';

@riverpod
class EditJobScreenController extends _$EditJobScreenController {
  @override
  FutureOr<void> build() {
    //
  }

  Future<bool> submit({JobID? jobId, Job? oldJob, required String name, required int ratePerHour}) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    // set loading state
    state = const AsyncLoading().copyWithPrevious(state);
    // check if name is already in use
    final repository = ref.read(jobsRepositoryProvider);
    final jobs = await repository.fetchJobs(uid: currentUser.uid);
    final allLowerCaseNames = jobs.map((job) => job.name.toLowerCase()).toList();
    // it's ok to use the same name as the old job
    if (oldJob != null) {
      allLowerCaseNames.remove(oldJob.name.toLowerCase());
    }
    // check if name is already used
    if (allLowerCaseNames.contains(name.toLowerCase())) {
      state = AsyncError(JobSubmitException(), StackTrace.current);
      return false;
    } else {
      // job previously existed
      if (jobId != null) {
        final job = Job(id: jobId, name: name, ratePerHour: ratePerHour);
        state = await AsyncValue.guard(
          () => repository.updateJob(uid: currentUser.uid, job: job),
        );
      } else {
        state = await AsyncValue.guard(
          () => repository.addJob(uid: currentUser.uid, name: name, ratePerHour: ratePerHour),
        );
      }
      return state.hasError == false;
    }
  }
}
