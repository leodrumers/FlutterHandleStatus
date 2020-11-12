import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managing_flutter_status/models/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  void setUserActive(User user) {
    emit(ActiveUser(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is ActiveUser) {
      User newUser = currentState.user.copyWith(age: age);
      emit(ActiveUser(newUser));
    }
  }

  void addProfession(String profession) {
    final currentState = state;
    if (currentState is ActiveUser) {
      User user = currentState.user;
      List<String> professions = user.professions;
      professions.add('$profession ${professions.length + 1}');
      User newUser = user.copyWith(professions: professions);
      emit(ActiveUser(newUser));
    }
  }

  void logOut() {
    emit(UserInitialState());
  }
}
