// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:gtk_flutter/src/common_widgets/async_value_widget.dart';
// import 'package:gtk_flutter/src/core/router/app_router.dart';
// import 'package:gtk_flutter/src/feature/jobs/data/jobs_repository.dart';
// import 'package:gtk_flutter/src/feature/jobs/domain/job.dart';
// import 'package:gtk_flutter/src/feature/jobs/presentation/job_entries_screen/job_entries_list.dart';

// class JobEntriesScreen extends ConsumerWidget {
//   const JobEntriesScreen({super.key, required this.jobId});
//   final JobID jobId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final jobAsync = ref.watch(jobStreamProvider(jobId));
//     return ScaffoldAsyncValueWidget<Job>(
//       value: jobAsync,
//       data: (job) => JobEntriesPageContents(job: job),
//     );
//   }
// }

// class JobEntriesPageContents extends StatelessWidget {
//   const JobEntriesPageContents({super.key, required this.job});
//   final Job job;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(job.name),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.edit, color: Colors.white),
//             onPressed: () => context.goNamed(
//               AppRoute.home.name,
//               pathParameters: {'id': job.id},
//               extra: job,
//             ),
//           ),
//         ],
//       ),
//       body: JobEntriesList(job: job),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add, color: Colors.white),
//         onPressed: () => context.goNamed(
//           AppRoute.addEntry.name,
//           pathParameters: {'id': job.id},
//           extra: job,
//         ),
//       ),
//     );
//   }
// }
