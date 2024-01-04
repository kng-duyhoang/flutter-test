class SubActivity {
  String id;
  String activity;
  String name;
  int amount;
  String unit;
  String iconCode;

  SubActivity({
    required this.id,
    required this.activity,
    required this.name,
    required this.amount,
    required this.unit,
    required this.iconCode,
  });
  factory SubActivity.fromJson(Map<String, dynamic> json) {
    return SubActivity(
      id: json['id'] ?? "",
      activity: json['activity'] ?? "",
      name: json['name'] ?? "",
      amount: json['amount'] ?? 0,
      unit: json['unit'] ?? "",
      iconCode: json['iconCode'] ?? "",
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