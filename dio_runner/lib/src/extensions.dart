import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

/// LibraryReaderExt
extension LibraryReaderExt on LibraryReader {
  /// annotatedWithElements
  Iterable<AnnotatedElement> annotatedWithElements(
    Iterable<Element> elements,
    TypeChecker checker, {
    bool throwOnUnresolved = true,
  }) sync* {
    for (final element in elements) {
      final annotation = checker.firstAnnotationOf(
        element,
        throwOnUnresolved: throwOnUnresolved,
      );
      if (annotation != null) {
        yield AnnotatedElement(ConstantReader(annotation), element);
      }
    }
  }
}
