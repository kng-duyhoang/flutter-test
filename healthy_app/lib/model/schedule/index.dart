// ignore_for_file: unrelated_type_equality_checks

class Schedule {
  String nameSchedule;
  String type;
  List<DaySchedule> timeLine;
  String id;
  Schedule({
    this.id = "",
    required this.nameSchedule,
    required this.type,
    this.timeLine = const [],
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonList = timeLine.map((model) => model.toJson()).toList();

    return {
      'nameSchedule': nameSchedule,
      'type': type,
      'timeLine': jsonList
    };
  }
  factory Schedule.fromJson(Map<String, dynamic> json) {
    var resultObject = json['timeLine'] as List;
    List<DaySchedule> resultsJson = resultObject.map((dynamic tagJson) => DaySchedule.fromJson(tagJson)).toList();
    return Schedule(
      nameSchedule: json['nameSchedule'] ?? "", 
      type: json['type'] ?? "",
      timeLine: resultsJson,
      id: json['id'] ?? ""
    );
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

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    var resultObject = json['itemsActivity'] as List;
    List<ActivitySchedule> resultsJson = resultObject.map((dynamic tagJson) => ActivitySchedule.fromJson(tagJson)).toList();
    return DaySchedule(
      itemsActivity: resultsJson,
    );
  }
}

class ActivitySchedule {
  dynamic startTime;
  dynamic endTime;
  String activityID;
  String name;
  List<SubActivitySchedule> itemsSubActivity;
  bool isParent;
  bool isExpanded;
  String itemsActivityId;
  ActivitySchedule({
    required this.endTime,
    required this.activityID,
    required this.startTime,
    required this.name,
    this.itemsActivityId = "",
    this.itemsSubActivity = const [],
    this.isExpanded = false,
    this.isParent = false,
  });

  Map<String, dynamic> toJson(){
    List<Map<String, dynamic>> jsonList = itemsSubActivity.map((model) => model.toJson()).toList();
    return {
      "name": name,
      "endTime": endTime ,
      "startTime": startTime,
      "activityID": activityID,
      "isParent": true,
      "itemsSubActivity": jsonList
    };
  }

  factory ActivitySchedule.fromJson(Map<String, dynamic> json) {
    // var resultObject = json['itemsSubActivity'] as List;
    // print(json['itemsActivityId'] == null);
    List<SubActivitySchedule> resultsJson = [];
    // if (resultObject.isNotEmpty) {
    //   resultsJson = resultObject.map((dynamic tagJson) => SubActivitySchedule.fromJson(tagJson)).toList();
    // }
    return ActivitySchedule(
      itemsActivityId: json['itemsActivityId'] ?? "", 
      name: json['activityName'] ?? "", 
      endTime: json['endTime'] ?? "",
      startTime: json['startTime'] ?? "",
      activityID: json['activityID'] ?? "",
      isParent: json['isParent'] ?? false,
      itemsSubActivity: resultsJson
    );
  }
}

class SubActivitySchedule {
  String subActivityId;
  dynamic duration;
  String name;
  SubActivitySchedule({
    required this.subActivityId,
    required this.duration,
    required this.name
  });

  Map<String, dynamic> toJson(){
    return {
      "subActivityId": subActivityId ,
      "duration": duration,
    };
  }

  factory SubActivitySchedule.fromJson(Map<String, dynamic> json) {
    return SubActivitySchedule(
      subActivityId: json['subActivityId'],
      duration: json['duration'] ?? "",
      name: json['name'] ?? ""
    );
  }
}
