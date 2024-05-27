// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// DioGenerator
// **************************************************************************

Future<List<Repo>?> _$getRepositories(
  Map<String, dynamic> params,
  List<Repo>? Function(dynamic) onSuccess,
) async {
  final res = await dio.get<dynamic>(
    '/repositories',
    queryParameters: params,
  );
  return onSuccess(res.data);
}

Future<List<Repo>?> _$uploadFile(
  FormData params,
  List<Repo>? Function(dynamic) onSuccess,
) async {
  final res = await dio.post<dynamic>(
    '/upload',
    data: params,
  );
  return onSuccess(res.data);
}

Future<dynamic> _$getDevelopers(
  dynamic Function(dynamic) onSuccess, [
  Map<String, dynamic>? params,
]) async {
  final res = await _dio.get<dynamic>(
    '/developers',
    queryParameters: params,
  );
  return onSuccess(res.data);
}

Future<dynamic> _$getLanguages(dynamic Function(dynamic) onSuccess) async {
  final res = await _dio.get<dynamic>(
    '/languages',
  );
  return onSuccess(res.data);
}

Future<dynamic> _$postRepository(
  dynamic Function(dynamic) onSuccess, [
  Map<String, dynamic>? params,
]) async {
  final res = await _dio.post<dynamic>(
    '/repositories',
    data: params,
  );
  return onSuccess(res.data);
}

Future<dynamic> _$postDeveloper(
  dynamic Function(dynamic) onSuccess, [
  Map<String, dynamic>? params,
]) async {
  final res = await _dio.post<dynamic>(
    '/developers',
    data: params,
  );
  return onSuccess(res.data);
}

Future<dynamic> _$postLanguage(dynamic Function(dynamic) onSuccess) async {
  final res = await _dio.post<dynamic>(
    '/languages',
  );
  return onSuccess(res.data);
}
