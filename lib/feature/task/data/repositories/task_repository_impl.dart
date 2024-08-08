import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl(this._datasource);

  final TaskDataSource _datasource;

  @override
  ResultFuture<EmployeeModel> employeeList() async {
    try {
      final response = await _datasource.employeeList();
      return Right(response);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid inProgressTaskUpdate(String status) async {
    // TODO: implement inProgressTaskUpdate
    throw UnimplementedError();
  }

  @override
  ResultVoid initiatedTaskUpdate(String status) async {
    // TODO: implement initiatedTaskUpdate
    throw UnimplementedError();
  }

  @override
  ResultVoid pendingTaskUpdate(String status) async {
    // TODO: implement pendingTaskUpdate
    throw UnimplementedError();
  }

  @override
  ResultFuture<TaskPlannerModel> statusBasedTask(String status) async {
    // TODO: implement statusBasedTask
    throw UnimplementedError();
  }

  @override
  ResultVoid testL1TaskUpdate(String status) async {
    // TODO: implement testL1TaskUpdate
    throw UnimplementedError();
  }

  @override
  ResultFuture<TaskPlannerModel> testL2TaskUpdate(String status) async {
    // TODO: implement testL2TaskUpdate
    throw UnimplementedError();
  }

  @override
  ResultFuture<TaskPlannerModel> todayTask(String date) async {
    try {
      final response = await _datasource.todayTask(date);
      return Right(response);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<TaskReportModel> taskReport() async {
    try {
      final response = await _datasource.taskReport();
      return Right(response);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
