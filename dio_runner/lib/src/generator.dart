import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dio_annotation/dio_annotation.dart';
import 'package:dio_runner/src/extensions.dart';
import 'package:dio_runner/src/output_helpers.dart';
// import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

const String _methodVar = 'method';
const String _urlVar = 'url';
const String _dioVar = 'dio';

// final Logger _logger = Logger('Dio Generator');

/// DioGenerator
class DioGenerator extends Generator {
  /// apiTypeChecker
  final apiTypeChecker = const TypeChecker.fromRuntime(Api);

  /// requestTypeChecker
  final requestTypeChecker = const TypeChecker.fromRuntime(Request);

  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final classElements = library.classes.where(apiTypeChecker.hasAnnotationOf);
    // .expand((element) => element.methods);
    final values = <String>{};

    for (final classElement in classElements) {
      final methodElements = classElement.methods;
      final classAnnotation = apiTypeChecker.firstAnnotationOf(classElement);
      if (classAnnotation != null) {
        for (final annotatedElement in library.annotatedWithElements(
          methodElements,
          requestTypeChecker,
        )) {
          final generatedValue = generateForAnnotatedElement(
            annotatedElement.element,
            annotatedElement.annotation,
            ConstantReader(classAnnotation),
            buildStep,
          );
          await for (final value in normalizeGeneratorOutput(generatedValue)) {
            values.add(value);
          }
        }
      }
    }

    return values.join('\n\n');
  }

  /// generateForAnnotatedElement
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader methodAnnotation,
    ConstantReader classAnnotation,
    BuildStep buildStep,
  ) {
    if (element is! MethodElement) {
      final friendlyName = element.displayName;
      throw InvalidGenerationSourceError(
        'Generator cannot target `$friendlyName`.',
        todo: 'Remove the [Request] annotation from `$friendlyName`.',
      );
    }

    return _buildDioRequestImplementationMethod(
      element,
      methodAnnotation,
      classAnnotation,
    );
  }

  String _buildDioRequestImplementationMethod(
    MethodElement element,
    ConstantReader methodAnnotation,
    ConstantReader classAnnotation,
  ) {
    final friendlyName = element.name;
    final returnType = element.returnType;
    final name = '_\$$friendlyName';
    final method = methodAnnotation.peek(_methodVar)?.stringValue ?? '';
    final url = methodAnnotation.peek(_urlVar)?.stringValue ?? '';
    final cDio = classAnnotation.peek(_dioVar)?.stringValue ?? '';
    final dio = methodAnnotation.peek(_dioVar)?.stringValue ?? cDio;
    final parameters = element.parameters;
    final requiredParameters =
        parameters.where((parameter) => parameter.isRequired);
    if (requiredParameters.isEmpty) {
      throw InvalidGenerationSourceError(
        'Method `$friendlyName` must contain a '
        "parameter of type 'SuccessConverter'",
      );
    }
    final optionalParameters =
        parameters.where((parameter) => parameter.isOptional);

    final scParams = parameters.where(isSuccessConverter);
    if (scParams.isEmpty) {
      throw InvalidGenerationSourceError(
        'Method `$friendlyName` must contain a '
        "parameter of type 'SuccessConverter'",
      );
    }
    final mapParams = parameters.where(isParams);
    // final fcParams = parameters.where(isFailureConverter);

    final methodBuilder = Method((builder) {
      builder
        ..name = name
        ..returns = Reference(returnType.toString())
        ..modifier = MethodModifier.async
        ..body = Code(
          _buildDioRequestImplementationMethodBody(
            method.toLowerCase(),
            url,
            dio,
            scParams.first,
            mapParams.isNotEmpty ? mapParams.first : null,
            // fcParams.isNotEmpty ? fcParams.first : null,
          ),
        );

      if (requiredParameters.isNotEmpty) {
        builder.requiredParameters = ListBuilder(
          requiredParameters.map(
            (parameter) => Parameter((parameterBuilder) {
              parameterBuilder
                ..name = parameter.name
                ..type = Reference(parameter.type.toString());
            }),
          ),
        );
      }

      if (optionalParameters.isNotEmpty) {
        builder.optionalParameters = ListBuilder(
          optionalParameters.map(
            (parameter) => Parameter((parameterBuilder) {
              parameterBuilder
                ..name = parameter.name
                ..required = false
                ..type = Reference(parameter.type.toString());
            }),
          ),
        );
      }
    });

    final emitter = DartEmitter();

    return DartFormatter().format('${methodBuilder.accept(emitter)}');
  }

  /// isSuccessConverter
  bool isParams(ParameterElement parameter) {
    return !isSuccessConverter(parameter) && !isFailureConverter(parameter);
  }

  /// isSuccessConverter
  bool isSuccessConverter(ParameterElement parameter) {
    final type = parameter.type.toString();
    return type.contains('Function') && !type.contains('void');
  }

  /// isFailureConverter
  bool isFailureConverter(ParameterElement parameter) {
    final type = parameter.type.toString();
    return type.contains('Function') && type.contains('void');
  }

  String _buildDioRequestImplementationMethodBody(
    String method,
    String url,
    String dio,
    ParameterElement onSuccess,
    ParameterElement? params,
  ) {
    var extra = '';
    if (params != null) {
      if (method == 'get') {
        extra = 'queryParameters: ${params.name},';
      }
      if (method == 'post') {
        extra = 'data: ${params.name},';
      }
    }

    return """
    final res = await $dio.$method<dynamic>(
      '$url',
      $extra
    );
    return ${onSuccess.name}(res.data);
    """;
  }
}

/// dioGeneratorFactoryBuilder
Builder dioGeneratorFactoryBuilder({String? header}) => PartBuilder(
      [DioGenerator()],
      '.dio.dart',
      header: header,
    );
