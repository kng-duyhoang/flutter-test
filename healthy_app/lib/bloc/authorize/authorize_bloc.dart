import 'package:flutter_bloc/flutter_bloc.dart';

part "authorize_event.dart";
part "authorize_state.dart";

class AuthorizeBloc extends Bloc<AuthorizeEvent, AuthorizeState> {

  static AuthorizeBloc? _instance;
  static AuthorizeBloc get instance {
    _instance ??= AuthorizeBloc();
    return _instance!;
  }

  AuthorizeBloc() : super(AuthorizeInit()) {
    on<AuthorizeEventSuccess>(authorizeSuccess);
    on<AuthorizeEventFail>(authorizeFail);
  }

  void authorizeSuccess(AuthorizeEventSuccess event, Emitter<AuthorizeState> emit) async {
    emit(AuthorizeSuccess());
  }

  void authorizeFail(AuthorizeEventFail event, Emitter<AuthorizeState> emit) async {
    emit(AuthorizeFail());
  }
}
