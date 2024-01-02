class Schedule {
  String nameSchedule;
  String type;
  List<DaySchedule> timeLine;
  Schedule({
    required this.nameSchedule,
    required this.type,
    required this.timeLine,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonList = timeLine.map((model) => model.toJson()).toList();

    return {
      'nameSchedule': nameSchedule,
      'type': type,
      'timeLine': jsonList
    };
  }
}

class DaySchedule {
  List<ActivitySchedule> itemsActivity;
  DaySchedule({
    required this.itemsActivity
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonList = itemsActivity.map((model) => model.toJson()).toList();
    return {
      'itemsActivity': jsonList,
    };
  }
}

class ActivitySchedule {
  int startTime;
  int endTime;
  String activity;
  String name;
  List<SubActivitySchedule> itemsSubActivity;
  ActivitySchedule({
    required this.endTime,
    required this.activity,
    required this.startTime,
    required this.name,
    required this.itemsSubActivity,
  });

  Map<String, dynamic> toJson(){
    List<Map<String, dynamic>> jsonList = itemsSubActivity.map((model) => model.toJson()).toList();
    return {
      "name": name ,
      "endTime": endTime ,
      "startTime": startTime,
      "activity": activity,
      "isParent": true,
      "itemsSubActivity": jsonList
    };
  }
}

class SubActivitySchedule {
  int subActivityId;
  int duration;
  SubActivitySchedule({
    required this.subActivityId,
    required this.duration,
  });

  Map<String, dynamic> toJson(){
    return {
      "subActivityId": subActivityId ,
      "duration": duration,
    };
  }
}
