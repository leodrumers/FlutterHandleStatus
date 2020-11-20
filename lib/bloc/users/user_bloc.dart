import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managing_flutter_status/models/user.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is ActiveUser) {
      yield state.copyWith(user: event.user);
    } else if (event is ChangeAge) {
      yield state.copyWith(user: state.user.copyWith(age: event.age));
    } else if (event is AddProfession) {
      yield state.copyWith(
          user: state.user.copyWith(professions: [
        ...state.user.professions,
        '${event.profession} ${state.user.professions.length}'
      ]));
    } else if (event is DeleteUser) {
      yield state.initialState();
    }
  }
}
