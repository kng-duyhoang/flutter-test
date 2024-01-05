class ListScheduleResponse {
  String message;
  List<DayScheduleResponse> items;
  ListScheduleResponse({
    required this.message,
    required this.items
  });
}

class DayScheduleResponse {
  String nameSchedule;
  String type;
  List<ScheduleResponse> timeLine;
  DayScheduleResponse({
    required this.nameSchedule,
    required this.type,
    required this.timeLine,
  });

  factory DayScheduleResponse.fromJson(Map<String, dynamic> json) {
    return DayScheduleResponse(
      nameSchedule: json['nameSchedule'],
      type: json['type'],
      timeLine: []
    );
  }
}

class ScheduleResponse {
  String id;
  TimeResponse endTime;
  TimeResponse startTime;
  ActivityResponse activity;
  ScheduleResponse({
    required this.id,
    required this.endTime,
    required this.startTime,
    required this.activity,
  });
}

class TimeResponse {
  int hour;
  int minutes;
  TimeResponse({
    required this.hour,
    required this.minutes
  });
}

class ActivityResponse {
  String id;
  String name;
  ActivityResponse({
    required this.id,
    required this.name
  });
}
