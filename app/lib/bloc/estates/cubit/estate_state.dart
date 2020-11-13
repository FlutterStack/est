part of 'estate_cubit.dart';

@immutable
abstract class EstateState extends Equatable {
  const EstateState();
}

class EstateInitial extends EstateState {
  const EstateInitial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EstateLoading extends EstateState {
  const EstateLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EstateLoaded extends EstateState {
  final List<EstateInfo> estate;
  const EstateLoaded(this.estate);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EstateError extends EstateState {
  final String msg;
  const EstateError(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
