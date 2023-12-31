part of "activity_bloc.dart";

class ActivityState extends Equatable{
  List<Activity> list;

  ActivityState({
    required this.list
  });

  @override
  List<Object> get props => [
    list
  ];
}
