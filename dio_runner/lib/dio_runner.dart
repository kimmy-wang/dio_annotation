/// dio_runner
library dio_runner;

import 'package:build/build.dart';
import 'package:dio_runner/src/generator.dart';

/// dioGeneratorFactory
Builder dioGeneratorFactory(BuilderOptions options) =>
    dioGeneratorFactoryBuilder(header: options.config['header'] as String?);
