import 'package:dio_annotation/dio_annotation.dart';

/// Get
class Get extends Request {
  /// constructor
  const Get({
    required super.url,
    super.dio,
    super.headers,
  }) : super(method: 'get');
}
