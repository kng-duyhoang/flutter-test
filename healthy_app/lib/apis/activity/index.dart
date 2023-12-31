import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/model/activity/index.dart';

class ScheduleApi {
  Future<ActivityListResponse> getListShedule() async {
    final response = await CoreApi.instance.get('/activities/getAllActivities');
    try {
      var resultObject = response.data['activities'] as List;
      List<Activity> items = resultObject.map((dynamic tagJson) => Activity.fromJson(tagJson)).toList();
      
      return ActivityListResponse(
        message: response.data["message"],
        items: items
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }
}
