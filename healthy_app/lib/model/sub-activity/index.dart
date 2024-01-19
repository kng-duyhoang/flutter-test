class SubActivity {
  String subActivityId;
  dynamic amount;
  String subActivityName;
  String type;
  SubActivity({
    required this.subActivityId,
    required this.amount,
    required this.subActivityName,
    this.type = ""
  });

  Map<String, dynamic> toJson(){
    return {
      "subActivityId": subActivityId ,
      "amount": amount,
    };
  }

  factory SubActivity.fromJson(Map<String, dynamic> json) {
    return SubActivity(
      subActivityId: json['subActivityId'] ?? "",
      amount: json['amount'] ?? "",
      subActivityName: json['subActivityName'] ?? "",
      type: json['type'] ?? ""
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
