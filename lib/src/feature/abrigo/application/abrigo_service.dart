// import 'package:gtk_flutter/src/feature/abrigos/data/abrigo_repository.dart';
// import 'package:gtk_flutter/src/feature/abrigos/domain/abrigo.dart';
// import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class AbrigoService {
//   AbrigoService(this.ref);

//   final Ref ref;

//   Future<List<Abrigo>> _fetchAbrigo() {
//     final user = ref.read(authRepositoryProvider).currentUser;
//     if (user != null) {
//       return ref.read(abrigosRepositoryProvider).fetchAbrigos(uid: user.uid);
//     } else {
//       return ref.read(abrigosRepositoryProvider).fetchAbrigos(uid: user!.uid);
//     }
//   }

//   Future<void> _updateAbrigo(Abrigo abrigo) async {
//     final user = ref.read(authRepositoryProvider).currentUser;
//     if (user != null) {
//       await ref.read(abrigosRepositoryProvider).updateAbrigo(uid: user.uid, abrigo: abrigo);
//     } else {
//       await ref.read(abrigosRepositoryProvider).updateAbrigo(uid: user!.uid, abrigo: abrigo);
//     }
//   }

  // Este vai no provider
  // final abrigoServiceProvider = Provider<AbrigoService>((ref) {
  //   return AbrigoService(ref);
  // });
// }
