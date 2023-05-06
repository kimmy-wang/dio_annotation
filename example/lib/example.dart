import 'package:dio/dio.dart';
import 'package:dio_annotation/dio_annotation.dart';

part 'example.dio.dart';

final dio = Dio();
final _dio = dio;

class Repo {
  const Repo();
}

class RequestedException {
  RequestedException(this.msg);
  final dynamic msg;
}

@Api()
class ExampleApi {
  @Request(method: 'get', url: '/repositories')
  static Future<List<Repo>?> getRepositories({
    required Map<String, dynamic> params,
    required SuccessConverter<List<Repo>?> onSuccess,
  }) =>
      _$getRepositories(params, onSuccess);

  @Post(url: '/upload')
  static Future<List<Repo>?> uploadFile({
    required FormData params,
    required SuccessConverter<List<Repo>?> onSuccess,
  }) =>
      _$uploadFile(params, onSuccess);

  @Request(method: 'get', url: '/developers', dio: '_dio')
  static Future<dynamic> getDevelopers({
    required SuccessConverter<dynamic> onSuccess,
    Map<String, dynamic>? params,
  }) =>
      _$getDevelopers(onSuccess, params);

  @Request(method: 'get', url: '/languages', dio: '_dio')
  static Future<dynamic> getLanguages({
    required SuccessConverter<dynamic> onSuccess,
  }) =>
      _$getLanguages(onSuccess);

  @Request(method: 'post', url: '/repositories', dio: '_dio')
  static Future<dynamic> postRepository({
    required SuccessConverter<dynamic> onSuccess,
    Map<String, dynamic>? params,
  }) =>
      _$postRepository(onSuccess, params);

  @Request(method: 'post', url: '/developers', dio: '_dio')
  static Future<dynamic> postDeveloper({
    required SuccessConverter<dynamic> onSuccess,
    required FailureConverter onError,
    Map<String, dynamic>? params,
  }) =>
      _$postDeveloper(onSuccess, onError, params);

  @Request(method: 'post', url: '/languages', dio: '_dio')
  static Future<dynamic> postLanguage({
    required SuccessConverter<dynamic> onSuccess,
  }) =>
      _$postLanguage(onSuccess);
}
