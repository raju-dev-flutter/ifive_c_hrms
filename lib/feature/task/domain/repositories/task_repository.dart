import '../../../../core/core.dart';
import '../../../feature.dart';

abstract interface class TaskRepository {
  ResultFuture<TaskPlannerModel> todayTask(String date);

  ResultFuture<TaskPlannerModel> statusBasedTask(String status);

  ResultFuture<TaskReportModel> taskReport();

  ResultVoid initiatedTaskUpdate(String status);

  ResultVoid pendingTaskUpdate(String status);

  ResultVoid inProgressTaskUpdate(String status);

  ResultVoid testL1TaskUpdate(String status);

  ResultVoid testL2TaskUpdate(String status);

  ResultFuture<EmployeeModel> employeeList();
}
