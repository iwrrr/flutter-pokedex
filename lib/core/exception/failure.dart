import 'package:equatable/equatable.dart';

/// Base class for representing application failures.
///
/// Used across domain, data, and features to propagate errors consistently.
/// Extends [Equatable] so it can be compared in Bloc states or unit tests.
abstract class Failure extends Equatable {
  const Failure({required this.message, this.cause});
  final String message;
  final dynamic cause;

  @override
  List<Object?> get props => [message, cause];
}

/// A common failure for network-related errors (e.g., API call failed).
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.cause});
}

/// A failure representing unexpected/unhandled errors.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message, super.cause});
}

/// A failure representing not found.
class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message, super.cause});
}
