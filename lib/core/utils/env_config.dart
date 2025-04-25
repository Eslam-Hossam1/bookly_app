import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConfig {
  static String get apiKey => dotenv.env['Api_key']!;
}
