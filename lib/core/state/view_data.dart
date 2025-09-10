import 'package:equatable/equatable.dart';

/// Sealed class wrapper for representing different view states.
///
/// Generic parameters:
/// - [T]: The type of the data.
/// - [E]: The type of the error (e.g. Failure, Exception, String).
sealed class ViewData<T, E> extends Equatable {
  const ViewData();

  @override
  List<Object?> get props => [];
}

/// Initial state before any action has been taken.
class ViewInitial<T, E> extends ViewData<T, E> {
  const ViewInitial();
}

/// Loading state, usually for async operations.
class ViewLoading<T, E> extends ViewData<T, E> {
  const ViewLoading({this.message});
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Success state with valid data.
class ViewSuccess<T, E> extends ViewData<T, E> {
  const ViewSuccess({required this.data});
  final T data;

  @override
  List<Object?> get props => [data];
}

/// No data available.
class ViewEmpty<T, E> extends ViewData<T, E> {
  const ViewEmpty({this.message});
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Error state with optional error object and message.
class ViewError<T, E> extends ViewData<T, E> {
  const ViewError({this.error, this.message});
  final E? error;
  final String? message;

  @override
  List<Object?> get props => [error, message];
}
