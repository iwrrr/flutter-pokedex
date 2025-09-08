import 'package:pokedex/core/exception/failure.dart';

/// Wrapper for handling async data states (Success / Failure).
///
/// Can be used in repositories, usecases, and Blocs.
sealed class DataState<T> {
  const DataState();
}

/// Represents successful data.
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(this.data);
  final T data;
}

/// Represents an error state.
class DataFailed<T> extends DataState<T> {
  const DataFailed(this.failure);
  final Failure failure;
}
