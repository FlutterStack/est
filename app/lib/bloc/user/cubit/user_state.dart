part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  const UserLoading();
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;
  const UserLoaded(this.user);
  @override
  List<Object> get props => [];
}

class UserError extends UserState {
  final String msg;
  const UserError(this.msg);
  @override
  List<Object> get props => [];
}

class UserUpdate extends UserState {
  final User user;
  const UserUpdate(this.user);

  @override
  List<Object> get props => [user];
}
