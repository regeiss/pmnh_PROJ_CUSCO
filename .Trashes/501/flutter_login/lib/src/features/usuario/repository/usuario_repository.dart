import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/api/error_data.dart';
import '../request/usuario_request.dart';
import '../data/usuario_data.dart';

abstract class UsuarioRepository 
{
  Future<dynamic> login(UsuarioRequest req);
}

class UsuarioRepositoryImpl implements UsuarioRepository 
{
  late Dio _dio;

  UsuarioRepositoryImpl() 
  {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseURL,
        responseType: ResponseType.json,
      ),
    );
  }

  @override
  Future<dynamic> login(UsuarioRequest request) async 
  {
    try   
    {
      final response = await _dio.post(Endpoints.loginURL, data: request.toJson());
      return UserResponse.fromJson(response.data);
    }
    on DioException   
    catch (ex) 
    {
      return ErrorResponse.fromJson(ex.response?.data);
    }
  }
}

final usuarioRepositoryProvider = Provider<UsuarioRepositoryImpl>((ref) 
{
  return UsuarioRepositoryImpl();
});
