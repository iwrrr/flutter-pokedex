import 'package:pokedex/core/state/view_data.dart';

/// Pattern-matching style extension for [ViewData].
extension ViewDataX<T, E> on ViewData<T, E> {
  R when<R>({
    required R Function() orElse,
    R Function()? onInitial,
    R Function(String? message)? onLoading,
    R Function(T data)? onSuccess,
    R Function(String? message)? onEmpty,
    R Function(E? error, String? message)? onError,
  }) {
    return switch (this) {
      // case ViewInitial<T, E>():
      //   return onInitial?.call() ?? orElse();
      // case ViewLoading<T, E>(:final message):
      //   return onLoading?.call(message) ?? orElse();
      // case ViewSuccess<T, E>(:final data):
      //   return onSuccess?.call(data) ?? orElse();
      // case ViewEmpty<T, E>(:final message):
      //   return onEmpty?.call(message) ?? orElse();
      // case ViewError<T, E>(:final error, :final message):
      //   return onError?.call(error, message) ?? orElse();
      ViewInitial() => onInitial?.call() ?? orElse(),
      ViewLoading(:final message) => onLoading?.call(message) ?? orElse(),
      ViewSuccess(:final data) => onSuccess?.call(data) ?? orElse(),
      ViewEmpty(:final message) => onEmpty?.call(message) ?? orElse(),
      ViewError(:final error, :final message) =>
        onError?.call(error, message) ?? orElse(),
    };
  }

  R whenSuccess<R>({
    required R Function(T data) onSuccess,
    required R Function() orElse,
  }) {
    return switch (this) {
      ViewSuccess<T, E>(:final data) => onSuccess(data),
      _ => orElse(),
    };
  }

  R whenError<R>({
    required R Function(E? error, String? message) onError,
    required R Function() orElse,
  }) {
    return switch (this) {
      ViewError<T, E>(:final error, :final message) => onError(error, message),
      _ => orElse(),
    };
  }
}
