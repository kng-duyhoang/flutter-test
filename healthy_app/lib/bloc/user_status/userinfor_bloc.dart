import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/model/authorize/index.dart';

part "userinfor_event.dart";
part "userinfor_state.dart";

class UserInforBloc extends Bloc<UserInforEvent, UserInforState>{
  static UserInforBloc? _instance;
  static UserInforBloc get instance {
    _instance ??= UserInforBloc();
    return _instance!;
  }

  UserInforBloc() : super(UserInforStateInit()) {
    on<UserInforEventUpdate>(userInforEventUpdate);
  }

  void userInforEventUpdate(UserInforEventUpdate event, Emitter<UserInforState> emit) async {
    emit(UserInforStateData(
      user: event.user
    ));
  } 
}
