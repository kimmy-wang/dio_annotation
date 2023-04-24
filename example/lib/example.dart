import 'package:dio/dio.dart';
import 'package:dio_annotation/dio_annotation.dart';

part 'example.dio.dart';

final _dio = Dio();

class Api {
  @Request<dynamic>(method: 'get', url: '/repositories', dio: '_dio')
  static Future<dynamic> getRepositories({
    required Map<String, dynamic> params,
    SuccessConverter<dynamic>? onSuccess,
    FailureConverter? onError,
  }) =>
      _$getRepositories(params, onSuccess, onError);

  @Request<dynamic>(method: 'get', url: '/developers', dio: '_dio')
  static Future<dynamic> getDevelopers({
    Map<String, dynamic>? params,
    SuccessConverter<dynamic>? onSuccess,
    FailureConverter? onError,
  }) =>
      _$getDevelopers(params, onSuccess, onError);

  @Request<dynamic>(method: 'get', url: '/languages', dio: '_dio')
  static Future<dynamic> getLanguages() =>
      _$getLanguages();

  @Request<dynamic>(method: 'post', url: '/repositories', dio: '_dio')
  static Future<dynamic> postRepository({
    required Map<String, dynamic> params,
    SuccessConverter<dynamic>? onSuccess,
    FailureConverter? onError,
  }) =>
      _$postRepository(params, onSuccess, onError);

  @Request<dynamic>(method: 'post', url: '/developers', dio: '_dio')
  static Future<dynamic> postDeveloper({
    Map<String, dynamic>? params,
    SuccessConverter<dynamic>? onSuccess,
    FailureConverter? onError,
  }) =>
      _$postDeveloper(params, onSuccess, onError);

  @Request<dynamic>(method: 'post', url: '/languages', dio: '_dio')
  static Future<dynamic> postLanguage() =>
      _$postLanguage();
}
