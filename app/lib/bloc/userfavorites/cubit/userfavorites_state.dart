part of 'userfavorites_cubit.dart';

@immutable
abstract class UserfavoritesState extends Equatable {
  const UserfavoritesState();
}

class UserfavoritesInitial extends UserfavoritesState {
  const UserfavoritesInitial();
  List<Object> get props => [];
}

class UserFavoritesLoading extends UserfavoritesState {
  const UserFavoritesLoading();
  @override
  List<Object> get props => [];
}

class UserFavoritesLoaded extends UserfavoritesState {
  final List<UserFav> userFav;
  const UserFavoritesLoaded(this.userFav);

  @override
  List<Object> get props => [];
}

class UserFavoritesError extends UserfavoritesState {
  final String msg;
  const UserFavoritesError(this.msg);
  @override
  List<Object> get props => [];
}
