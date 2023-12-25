part of "user_bloc.dart";

class UserState { }

class UserInitial extends UserState {}
class UserData extends UserState {
  final User user;
  UserData({required this.user});
}
