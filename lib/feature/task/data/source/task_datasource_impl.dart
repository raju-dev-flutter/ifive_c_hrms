import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../core/core.dart';
import '../../task.dart';

class TaskDataSourceImpl implements TaskDataSource {
  const TaskDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<EmployeeModel> employeeList() async {
    try {
      final urlParse = Uri.parse(ApiUrl.employeeListEndPoint);
      final token = SharedPrefs().getToken();
      final response = await _client.get(
        urlParse,
        headers: {'content-type': 'application/json', 'token': token},
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: "Network Error", statusCode: response.statusCode);
      }
      final jsonResponse = jsonDecode(response.body);
      return EmployeeModel.fromJson(jsonResponse);
    } on APIException {
      rethrow;
    } catch (e) {
      throw const APIException(message: "Network Error", statusCode: 505);
    }
  }

  @override
  Future<void> inProgressTaskUpdate(String status) async {
    // TODO: implement inProgressTaskUpdate
    throw UnimplementedError();
  }

  @override
  Future<void> initiatedTaskUpdate(String status) async {
    // TODO: implement initiatedTaskUpdate
    throw UnimplementedError();
  }

  @override
  Future<void> pendingTaskUpdate(String status) async {
    // TODO: implement pendingTaskUpdate
    throw UnimplementedError();
  }

  @override
  Future<TaskPlannerModel> statusBasedTask(String status) async {
    // TODO: implement statusBasedTask
    throw UnimplementedError();
  }

  @override
  Future<void> testL1TaskUpdate(String status) async {
    // TODO: implement testL1TaskUpdate
    throw UnimplementedError();
  }

  @override
  Future<void> testL2TaskUpdate(String status) async {
    // TODO: implement testL2TaskUpdate
    throw UnimplementedError();
  }

  @override
  Future<TaskPlannerModel> todayTask(String date) async {
    try {
      final urlParse = Uri.parse(ApiUrl.taskPlannerCommonEndPoint);
      final token = SharedPrefs().getToken();
      final response = await _client.get(
        urlParse,
        headers: {
          'content-type': 'application/json',
          'token': token,
          'date': date
        },
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: "Network Error", statusCode: response.statusCode);
      }
      Logger().d(response.body);
      final jsonResponse = jsonDecode(response.body);
      return TaskPlannerModel.fromJson(jsonResponse);
    } on APIException {
      rethrow;
    } catch (e) {
      throw const APIException(message: "Network Error", statusCode: 505);
    }
  }

  @override
  Future<TaskReportModel> taskReport() async {
    try {
      final urlParse = Uri.parse(ApiUrl.taskPlannerReportEndPoint);
      final token = SharedPrefs().getToken();
      final response = await _client.get(
        urlParse,
        headers: {'content-type': 'application/json', 'token': token},
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: "Network Error", statusCode: response.statusCode);
      }
      final jsonResponse = jsonDecode(response.body);
      return TaskReportModel.fromJson(jsonResponse);
    } on APIException {
      rethrow;
    } catch (e) {
      throw const APIException(message: "Network Error", statusCode: 505);
    }
  }
}
