import 'package:bloc/bloc.dart';
import 'package:handyman_tech/repository/user_repository.dart';
import 'package:handyman_tech/ui/auth/auth_bloc/auth_event.dart';
import 'package:handyman_tech/ui/auth/auth_bloc/auth_state.dart';
class AuthBloc extends Bloc<AuthEvent,AuthState>{
  DataBase db=DataBase();
  AuthBloc() : super(AuthState.init()) {
    on<AddUserEvent>((event, emit) {

      emit(state.update(dataAdded: false));
      db.addUsers(event.user);
      emit(state.update(dataAdded: true));
    });

  }

  // @override
  // Stream<AuthState> mapEventToState(
  //     AuthEvent event,
  //     ) async* {
  //   if(event is AddUserEvent)
  //     {
  //       yield state.update(dataAdded: false);
  //       db.addUsers(event.user);
  //       yield state.update(dataAdded: true);
  //     }
  //
  // }
}