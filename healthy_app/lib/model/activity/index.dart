class ActivityListResponse {
  String message;
  List<Activity> items;

  ActivityListResponse({
    required this.message,
    required this.items
  });
}

class Activity {
  String id;
  String name;
  String desciption;
  bool isParent;

  Activity({
    required this.id,
    required this.name,
    required this.desciption,
    required this.isParent
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json["_id"] ?? "0",
      name: json["name"] ?? "",
      desciption: json['desciption'] ?? "",
      isParent: json['isParent']  ?? false,
    );
  } 
}

