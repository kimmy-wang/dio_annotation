/// Request
class Request {
  /// constructor
  const Request({
    required this.method,
    required this.url,
    this.dio = 'dio',
    this.headers,
  });

  /// dio instance
  final String dio;

  /// request method
  final String method;

  /// request url
  final String url;

  /// request extra headers
  final Map<String, dynamic>? headers;
}
