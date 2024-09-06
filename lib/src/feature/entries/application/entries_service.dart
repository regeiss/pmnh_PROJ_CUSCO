import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/auth/domain/app_user.dart';
import 'package:gtk_flutter/src/feature/entries/data/entries_repository.dart';
import 'package:gtk_flutter/src/feature/entries/domain/daily_jobs_details.dart';
import 'package:gtk_flutter/src/feature/entries/domain/entries_list_tile_model.dart';
import 'package:gtk_flutter/src/feature/entries/domain/entry.dart';
import 'package:gtk_flutter/src/feature/entries/domain/entry_job.dart';
import 'package:gtk_flutter/src/feature/jobs/data/jobs_repository.dart';
import 'package:gtk_flutter/src/feature/jobs/domain/job.dart';
import 'package:gtk_flutter/src/utils/format.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'entries_service.g.dart';

class EntriesService {
  EntriesService({required this.jobsRepository, required this.entriesRepository});
  final JobsRepository jobsRepository;
  final EntriesRepository entriesRepository;

  /// combine List<Job>, List<Entry> into List<EntryJob>
  Stream<List<EntryJob>> _allEntriesStream(UserID uid) => CombineLatestStream.combine2(
        entriesRepository.watchEntries(uid: uid),
        jobsRepository.watchJobs(uid: uid),
        _entriesJobsCombiner,
      );

  static List<EntryJob> _entriesJobsCombiner(List<Entry> entries, List<Job> jobs) {
    return entries.map((entry) {
      final job = jobs.firstWhere((job) => job.id == entry.jobId);
      return EntryJob(entry, job);
    }).toList();
  }

  /// Output stream
  Stream<List<EntriesListTileModel>> entriesTileModelStream(UserID uid) => _allEntriesStream(uid).map(_createModels);

  static List<EntriesListTileModel> _createModels(List<EntryJob> allEntries) {
    if (allEntries.isEmpty) {
      return [];
    }
    final allDailyJobsDetails = DailyJobsDetails.all(allEntries);

    // total duration across all jobs
    final totalDuration = allDailyJobsDetails.map((dateJobsDuration) => dateJobsDuration.duration).reduce((value, element) => value + element);

    // total pay across all jobs
    final totalPay = allDailyJobsDetails.map((dateJobsDuration) => dateJobsDuration.pay).reduce((value, element) => value + element);

    return <EntriesListTileModel>[
      EntriesListTileModel(
        leadingText: 'All Entries',
        middleText: Format.currency(totalPay),
        trailingText: Format.hours(totalDuration),
      ),
      for (DailyJobsDetails dailyJobsDetails in allDailyJobsDetails) ...[
        EntriesListTileModel(
          isHeader: true,
          leadingText: Format.date(dailyJobsDetails.date),
          middleText: Format.currency(dailyJobsDetails.pay),
          trailingText: Format.hours(dailyJobsDetails.duration),
        ),
        for (JobDetails jobDuration in dailyJobsDetails.jobsDetails)
          EntriesListTileModel(
            leadingText: jobDuration.name,
            middleText: Format.currency(jobDuration.pay),
            trailingText: Format.hours(jobDuration.durationInHours),
          ),
      ]
    ];
  }
}

@riverpod
EntriesService entriesService(EntriesServiceRef ref) {
  return EntriesService(
    jobsRepository: ref.watch(jobsRepositoryProvider),
    entriesRepository: ref.watch(entriesRepositoryProvider),
  );
}

@riverpod
Stream<List<EntriesListTileModel>> entriesTileModelStream(EntriesTileModelStreamRef ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null when fetching entries');
  }
  final entriesService = ref.watch(entriesServiceProvider);
  return entriesService.entriesTileModelStream(user.uid);
}
