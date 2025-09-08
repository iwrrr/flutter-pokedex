import 'package:pokedex/core/exception/failure.dart';
import 'package:pokedex/core/state/data_state.dart';
import 'package:pokedex/core/state/view_data.dart';

/// Extension to convert [DataState] from usecases into [ViewData]
/// for presentation layer (Cubit/Bloc).
extension DataStateX<T> on DataState<T> {
  ViewData<T, Failure> toViewData() {
    switch (this) {
      case DataSuccess<T>(:final data):
        return ViewSuccess<T, Failure>(data: data);
      case DataFailed<T>(:final failure):
        return ViewError<T, Failure>(error: failure, message: failure.message);
    }
  }
}
