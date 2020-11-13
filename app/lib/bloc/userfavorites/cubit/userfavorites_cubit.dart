import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expert_properties/Model/user_favorites.dart';
import 'package:expert_properties/bloc/user/repository/user_repository.dart';
import 'package:expert_properties/bloc/userfavorites/repository/userfavorites_repository.dart';
import 'package:meta/meta.dart';

part 'userfavorites_state.dart';

class UserfavoritesCubit extends Cubit<UserfavoritesState> {
  final UserFavRepository _userFavRepository;
  UserfavoritesCubit(this._userFavRepository) : super(UserfavoritesInitial());

  Future<bool> addUserFavorites(int estateId, int userId) async {
    try {
      final isSave =
          await _userFavRepository.addUserFavorites(estateId, userId);
      if (isSave == true) {
        return isSave;
      } else {
        return isSave;
      }
    } on Exception {
      print("Unable to save to favorites");
    }
  }

  Future<List<UserFav>> getAllUserFavorites(int userId) async {
    try {
      emit(UserFavoritesLoading());
      final userFavorites = await _userFavRepository.getUserFavorites(userId);
      if (userFavorites != null) {
        emit(UserFavoritesLoaded(userFavorites));
      } else {
        emit(UserFavoritesError("Unable to load favorites"));
      }
    } on Exception {
      print("Unable to get all records");
    }
  }
}
