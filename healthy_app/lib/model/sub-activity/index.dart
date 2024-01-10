class SubActivity {
  String subActivityId;
  dynamic duration;
  String name;
  SubActivity({
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

  factory SubActivity.fromJson(Map<String, dynamic> json) {
    return SubActivity(
      subActivityId: json['subActivityId'],
      duration: json['duration'] ?? "",
      name: json['name'] ?? ""
    );
  }
}

class SubActivityResponse {
  String message;
  List<SubActivity> items;
  SubActivityResponse({
    required this.message,
    required this.items
  });
}
