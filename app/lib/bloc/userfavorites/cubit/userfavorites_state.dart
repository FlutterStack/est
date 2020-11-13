part of 'userfavorites_cubit.dart';

@immutable
abstract class UserfavoritesState extends Equatable {
  const UserfavoritesState();
}

class UserfavoritesInitial extends UserfavoritesState {
  const UserfavoritesInitial();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserFavoritesLoading extends UserfavoritesState {
  const UserFavoritesLoading();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserFavoritesLoaded extends UserfavoritesState {
  final List<UserFav> userFav;
  const UserFavoritesLoaded(this.userFav);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserFavoritesError extends UserfavoritesState {
  final String msg;
  const UserFavoritesError(this.msg);
  @override
  // TODO: implement props
  List<Object> get props => [];
}
