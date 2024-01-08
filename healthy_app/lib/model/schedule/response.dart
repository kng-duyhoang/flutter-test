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
  String id;
  DayScheduleResponse({
    required this.nameSchedule,
    required this.type,
    required this.id,
  });

  factory DayScheduleResponse.fromJson(Map<String, dynamic> json) {
    return DayScheduleResponse(
      nameSchedule: json['nameSchedule'],
      type: json['type'],
      id: json['id']
    );
  }
}
