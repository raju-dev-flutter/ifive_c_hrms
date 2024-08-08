import '../../../../core/core.dart';
import '../../task.dart';

abstract interface class TaskDataSource {
  Future<TaskPlannerModel> todayTask(String date);

  Future<TaskPlannerModel> statusBasedTask(String status);

  Future<TaskReportModel> taskReport();

  Future<void> initiatedTaskUpdate(String status);

  Future<void> pendingTaskUpdate(String status);

  Future<void> inProgressTaskUpdate(String status);

  Future<void> testL1TaskUpdate(String status);

  Future<void> testL2TaskUpdate(String status);

  Future<EmployeeModel> employeeList();
}
