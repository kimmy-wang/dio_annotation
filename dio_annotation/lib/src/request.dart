/// Request
class Request {
  /// constructor
  const Request({
    required this.method,
    required this.url,
    this.dio,
    this.headers,
  });

  /// request method
  final String method;

  /// request url
  final String url;

  /// dio instance
  final String? dio;

  /// request extra headers
  final Map<String, dynamic>? headers;
}
