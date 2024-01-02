import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/model/timer/index.dart';

class ScheduleApi {
  Future<ActivityListResponse> getListActivity() async {
    final response = await CoreApi.instance.get('/activities/get-all-activities');
    try {
      var resultObject = response.data['items'] as List;
      List<Activity> items = resultObject.map((dynamic tagJson) => Activity.fromJson(tagJson)).toList();
      
      return ActivityListResponse(
        message: response.data["message"],
        items: items
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }

  Future<TimerResponse> getTimer() async {
    final response = await CoreApi.instance.get('/time/getTime');
    try {
      var resultObject = response.data['time'] as List;
      List<Time> items = resultObject.map((dynamic tagJson) => Time.fromJson(tagJson)).toList();
      
      return TimerResponse(
        message: response.data["message"],
        timers: items
      );
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }

  Future<String> createSchedule(data) async {
    final response = await CoreApi.instance.post('/schedule/create-schedule', data: data);
    try {
      return response.data["message"];
    } catch (error) {
      throw Exception('Post request failed: $error');
    }
  }
}
