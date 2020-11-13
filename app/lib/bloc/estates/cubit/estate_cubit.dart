import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expert_properties/Model/estate.dart';
import 'package:expert_properties/bloc/estates/repository/estate_repository.dart';
import 'package:meta/meta.dart';

part 'estate_state.dart';

class EstateCubit extends Cubit<EstateState> {
  final EstateRepository _estateRepository;
  EstateCubit(this._estateRepository) : super(EstateInitial());

  Future<List<EstateInfo>> getEstatesByPropertyId(int propertyId) async {
    try {
      final estates =
          await _estateRepository.getEstatesByPropertyId(propertyId);
      if (estates != null) {
        emit(EstateLoaded(estates));
        // return estates.toList();
      } else {
        emit(EstateError("Unable to fetch estates"));
      }
    } on Exception {
      print("Unable to load estates");
    }
  }

  Future getEstateDetails(int estateId) async {
    try {
      final details = await _estateRepository.getEstateDetails(estateId);
      if (details != null) {
        return details.toList();
      } else {
        return null;
      }
    } on Exception {
      print("Unable to load details");
    }
  }
}
