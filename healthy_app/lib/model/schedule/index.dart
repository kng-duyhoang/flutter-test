class Schedule {
  String name;
  String type;
  List<DaySchedule> items;

  Schedule({
    required this.name,
    required this.type,
    required this.items,
  });
}


class DaySchedule {
  List<ActivitySchedule> items;

  DaySchedule({
    required this.items
  });
}

class ActivitySchedule {
  String startTime;
  String endTime;
  String sheduleId;
  String name;
  ActivitySchedule({
    required this.endTime,
    required this.sheduleId,
    required this.startTime,
    required this.name,
  });
}
