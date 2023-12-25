
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/model/user/index.dart';

part "user_event.dart";
part "user_state.dart";
class UserBloc extends Bloc<UserEvent, UserState> {
  static UserBloc? _instance;
  static UserBloc get instance {
    _instance ??= UserBloc();
    return _instance!;
  }

  UserBloc() : super(UserInitial()) {
    on<UserEventSuccess>(userEventSuccess);
  }
  
  void userEventSuccess(UserEventSuccess event, Emitter<UserState> emit) async {
    emit(UserData(
      user: event.user
    ));
  } 
}
