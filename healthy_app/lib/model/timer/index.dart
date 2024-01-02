class TimerResponse {
  String message;
  List<Time> timers;
  TimerResponse({
    required this.message,
    required this.timers
  });
}

class Time {
  int idTimes;
  int hour;
  int minutes;
  Time({
    required this.idTimes,
    required this.hour,
    required this.minutes,
  });
  
  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      idTimes: json['idTimes'],
      hour: json['hour'],
      minutes: json['minutes'],
    );
  }
}
