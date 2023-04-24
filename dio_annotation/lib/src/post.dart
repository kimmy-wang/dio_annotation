import 'package:dio_annotation/dio_annotation.dart';

/// Post
class Post extends Request {
  /// constructor
  const Post({
    required super.url,
    super.dio,
    super.headers,
  }) : super(method: 'post');
}
