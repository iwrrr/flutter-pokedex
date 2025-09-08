import 'package:dio/dio.dart';
import 'package:pokedex/core/exception/failure.dart';

/// Utility to consistently map Exceptions into [Failure] objects.
/// Keeps the mapping logic in one place so repositories stay clean.
class ErrorMapper {
  static Failure map(Object e, {StackTrace? stackTrace}) {
    switch (e) {
      case DioException():
        return NetworkFailure(message: e.message ?? 'API error', cause: e);
      default:
        return UnexpectedFailure(message: e.toString(), cause: e);
    }
  }
}
