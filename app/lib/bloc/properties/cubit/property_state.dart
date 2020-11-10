part of 'property_cubit.dart';

@immutable
abstract class PropertyState extends Equatable {
  const PropertyState();
}

class PropertyInitial extends PropertyState {
  const PropertyInitial();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PropertyLoading extends PropertyState {
  const PropertyLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PropertyLoaded extends PropertyState {
  final List<Property> property;
  const PropertyLoaded(this.property);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PropertyError extends PropertyState {
  final String msg;
  const PropertyError(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
