part of 'user_bloc.dart';

class UserState {
  final bool userExist;
  final User user;

  UserState({User user})
      : this.user = user ?? null,
        this.userExist = user != null ? true : false;

  UserState copyWith({User user}) => UserState(user: user ?? this.user);

  UserState initialState() => UserState();
}
