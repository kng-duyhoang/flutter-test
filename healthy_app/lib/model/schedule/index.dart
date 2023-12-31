class Schedule {
  final String name;
  final String type;
  final List<DayTask> listTask;

  Schedule({
    required this.name,
    required this.type,
    required this.listTask,
  });
}

class DayTask {
  final int index;
  final Activity activity;
  DayTask({
    required this.index,
    required this.activity
  });
}

class Activity {
  final int activityID;
  final bool isParent;
  final String startAt;
  final String endAt;
  final SubActivity subActivity;

  Activity({
    required this.activityID,
    required this.isParent,
    required this.startAt,
    required this.endAt,
    required this.subActivity,
  });
}

class SubActivity {
  final int subID;
  final String duration;
  SubActivity({
    required this.subID,
    required this.duration,
  });
}
