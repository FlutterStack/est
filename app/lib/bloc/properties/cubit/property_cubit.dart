import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expert_properties/Model/properties.dart';
import 'package:expert_properties/bloc/properties/repository/property_repository.dart';
import 'package:meta/meta.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertyRepo _propertyRepo;
  PropertyCubit(this._propertyRepo) : super(PropertyInitial());

  Future<List<Property>> loadProperties() async {
    try {
      emit(PropertyLoading());
      final properties = await _propertyRepo.loadProperties();
      if (properties.length != 0) {
        emit(PropertyLoaded(properties));
      }
    } on Exception {
      print("Unablet to load properties");
    }
  }
}
