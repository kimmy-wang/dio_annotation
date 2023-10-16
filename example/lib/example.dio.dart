// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// DioGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<List<Repo>?> _$getRepositories(
  Map<String, dynamic> params,
  List<Repo>? Function(dynamic) onSuccess,
) async {
  try {
    final res = await dio.get(
      '/repositories',
      queryParameters: params,
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    if (error is DioException) {
      throw RequestedException(error.error);
    }
    throw RequestedException(error.toString());
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<List<Repo>?> _$uploadFile(
  FormData params,
  List<Repo>? Function(dynamic) onSuccess,
) async {
  try {
    final res = await dio.post(
      '/upload',
      data: params,
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    if (error is DioException) {
      throw RequestedException(error.error);
    }
    throw RequestedException(error.toString());
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$getDevelopers(
  dynamic Function(dynamic) onSuccess, [
  Map<String, dynamic>? params,
]) async {
  try {
    final res = await _dio.get(
      '/developers',
      queryParameters: params,
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    if (error is DioException) {
      throw RequestedException(error.error);
    }
    throw RequestedException(error.toString());
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$getLanguages(dynamic Function(dynamic) onSuccess) async {
  try {
    final res = await _dio.get(
      '/languages',
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    if (error is DioException) {
      throw RequestedException(error.error);
    }
    throw RequestedException(error.toString());
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$postRepository(
  dynamic Function(dynamic) onSuccess, [
  Map<String, dynamic>? params,
]) async {
  try {
    final res = await _dio.post(
      '/repositories',
      data: params,
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    if (error is DioException) {
      throw RequestedException(error.error);
    }
    throw RequestedException(error.toString());
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$postDeveloper(
  dynamic Function(dynamic) onSuccess,
  void Function(Exception, StackTrace) onError, [
  Map<String, dynamic>? params,
]) async {
  try {
    final res = await _dio.post(
      '/developers',
      data: params,
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    onError(error, stack);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$postLanguage(dynamic Function(dynamic) onSuccess) async {
  try {
    final res = await _dio.post(
      '/languages',
    );
    return onSuccess(res.data);
  } on Exception catch (error, stack) {
    if (error is DioException) {
      throw RequestedException(error.error);
    }
    throw RequestedException(error.toString());
  }
}
