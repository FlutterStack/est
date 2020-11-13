import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expert_properties/Model/ProposalModel.dart';
import 'package:expert_properties/Model/user.dart';
import 'package:expert_properties/SignupScreen/updateuser.dart';
import 'package:expert_properties/bloc/user/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());

  ////////////////////
  ///getUser
  ////////////////////
  Future<User> getUser(String email, String password) async {
    try {
      emit(UserInitial());
      final user = await _userRepository.getUser(email, password);
      print("INFO OF USER: " + user.toString());
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(UserInitial());
      }
    } on Exception {
      print("Unable to get user");
      return null;
    }
  }

  ///////////////////////////
  ////logoutUser
  //////////////////////////
  Future<void> logoutUser() async {
    try {
      print("STATE IS RESTARTING");
      emit(UserInitial());
    } on Exception {
      emit(UserError("Error, failed to sign in the user"));
    }
  }

  Future<bool> registerUser(Map<String, dynamic> info) async {
    try {
      final isRegistrationSuccess = await _userRepository.registerUser(info);
      return isRegistrationSuccess;
    } on Exception {
      print("Unable to register user");
    }
  }

  Future<bool> updateUser(Map<String, dynamic> info, User user) async {
    try {
      final isUpdateSuccess = await _userRepository.updateUserInfo(info);
      if (isUpdateSuccess == true) {
        emit(UserUpdate(user));
      } else {
        return null;
      }
    } on Exception {
      print("Unable to register user");
    }
  }
}
