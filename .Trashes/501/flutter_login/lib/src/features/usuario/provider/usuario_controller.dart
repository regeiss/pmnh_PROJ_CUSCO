import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api/error_data.dart';
import '../../login/repository/auth_repository.dart';
import '../repository/usuario_repository.dart';
import '../request/usuario_request.dart';

class UsuarioController extends StateNotifier<AsyncValue<dynamic>> 
{
  Ref ref;

  UsuarioController({
    required this.ref,
  }) : super(const AsyncData(null));

  Future<Either<String, bool>> login({required String email, required String password}) async 
  {
    state = const AsyncLoading();

    UsuarioRequest userReq = UsuarioRequest(identifier: email, password: password);
    final response = await ref.read(usuarioRepositoryProvider).login(userReq);

    if (response is ErrorResponse) 
    {
      return Left(response.error.message);
    } 
    else 
    {
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    }
  }
}

final usuarioControllerProvider = StateNotifierProvider<UsuarioController, AsyncValue<dynamic>> ((ref) 
{
  return UsuarioController(ref: ref);
});
