part of "darkmode_bloc.dart";

class DarkModeState extends Equatable {
  DarkModeState({ required this.mode});

  late String mode;

  @override
  List<Object> get props => [
    mode
  ];
}
