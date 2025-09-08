part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ViewData<List<Pokemon>, Failure> pokemonsState;

  const HomeState({this.pokemonsState = const ViewInitial()});

  HomeState copyWith({ViewData<List<Pokemon>, Failure>? pokemonsState}) {
    return HomeState(pokemonsState: pokemonsState ?? this.pokemonsState);
  }

  @override
  List<Object> get props => [pokemonsState];
}
