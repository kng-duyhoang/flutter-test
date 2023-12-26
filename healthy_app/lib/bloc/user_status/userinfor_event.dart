part of "userinfor_bloc.dart";

class UserInforEvent {}

class UserInforEventUpdate extends UserInforEvent {
  UserInforModel user;

  UserInforEventUpdate({
    required this.user,
  });
}
