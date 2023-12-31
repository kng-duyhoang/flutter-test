class Schedule {
  String name;
  String type;
  List<ActivitySchedule> items;

  Schedule({
    required this.name,
    required this.type,
    required this.items,
  });
}


class ActivitySchedule {
  String startTime;
  String endTime;
  String sheduleId;
  ActivitySchedule({
    required this.endTime,
    required this.sheduleId,
    required this.startTime
  });
}
