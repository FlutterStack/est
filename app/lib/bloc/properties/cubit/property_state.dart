part of 'property_cubit.dart';

@immutable
abstract class PropertyState extends Equatable {
  const PropertyState();
}

class PropertyInitial extends PropertyState {
  const PropertyInitial();
  @override
  List<Object> get props => [];
}

class PropertyLoading extends PropertyState {
  const PropertyLoading();

  @override
  List<Object> get props => [];
}

class PropertyLoaded extends PropertyState {
  final List<Property> property;
  const PropertyLoaded(this.property);

  @override
  List<Object> get props => [];
}

class PropertyError extends PropertyState {
  final String msg;
  const PropertyError(this.msg);

  @override
  List<Object> get props => [];
}
