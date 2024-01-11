part of "authorize_bloc.dart";

class AuthorizeState extends Equatable{
  AuthorizeState({this.token = ""});
  String token;
  @override
  List<Object> get props => [token];
}

// class AuthorizeStateInitial extends AuthorizeState {
//   final String token = Store.instance.getString(StoreKeys.token) ?? "";

//   @override
//   List<String> get props => [token];
// }
// class AuthorizeStateSuccess extends AuthorizeState {}
// class AuthorizeStateFail extends AuthorizeState{}
