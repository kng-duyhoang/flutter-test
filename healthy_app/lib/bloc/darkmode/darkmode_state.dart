part of "darkmode_bloc.dart";

class DarkModeState extends Equatable {
  DarkModeState({ this.mode = ""});

  late String mode;

  @override
  List<Object> get props => [
    mode
  ];
}
