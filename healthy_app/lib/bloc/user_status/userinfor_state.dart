part of "userinfor_bloc.dart";

class UserInforState {}
class UserInforStateInit extends UserInforState {}

class UserInforStateData extends UserInforState {
  UserInforModel user;

  UserInforStateData({
    required this.user,
  });
}
