/// SuccessConverter
typedef SuccessConverter<T> = T Function(dynamic data);

/// FailureConverter
typedef FailureConverter = void Function(Exception error, StackTrace stack);
