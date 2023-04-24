// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// DioGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$getRepositories(
  Map<String, dynamic> params, [
  dynamic Function(dynamic)? onSuccess,
  void Function(Exception, StackTrace)? onError,
]) async {
  try {
    final res = await _dio.get(
      '/repositories',
      queryParameters: params,
    );
    return onSuccess == null ? res.data : onSuccess(res.data);
  } on Exception catch (error, stack) {
    onError == null
        ? print('error: $error, stack: $stack')
        : onError(error, stack);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$getDevelopers([
  Map<String, dynamic>? params,
  dynamic Function(dynamic)? onSuccess,
  void Function(Exception, StackTrace)? onError,
]) async {
  try {
    final res = await _dio.get(
      '/developers',
      queryParameters: params,
    );
    return onSuccess == null ? res.data : onSuccess(res.data);
  } on Exception catch (error, stack) {
    onError == null
        ? print('error: $error, stack: $stack')
        : onError(error, stack);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$getLanguages() async {
  try {
    final res = await _dio.get(
      '/languages',
    );
    return res.data;
  } on Exception catch (error, stack) {
    print('error: $error, stack: $stack');
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$postRepository(
  Map<String, dynamic> params, [
  dynamic Function(dynamic)? onSuccess,
  void Function(Exception, StackTrace)? onError,
]) async {
  try {
    final res = await _dio.post(
      '/repositories',
      data: params,
    );
    return onSuccess == null ? res.data : onSuccess(res.data);
  } on Exception catch (error, stack) {
    onError == null
        ? print('error: $error, stack: $stack')
        : onError(error, stack);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$postDeveloper([
  Map<String, dynamic>? params,
  dynamic Function(dynamic)? onSuccess,
  void Function(Exception, StackTrace)? onError,
]) async {
  try {
    final res = await _dio.post(
      '/developers',
      data: params,
    );
    return onSuccess == null ? res.data : onSuccess(res.data);
  } on Exception catch (error, stack) {
    onError == null
        ? print('error: $error, stack: $stack')
        : onError(error, stack);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
Future<dynamic> _$postLanguage() async {
  try {
    final res = await _dio.post(
      '/languages',
    );
    return res.data;
  } on Exception catch (error, stack) {
    print('error: $error, stack: $stack');
  }
}
