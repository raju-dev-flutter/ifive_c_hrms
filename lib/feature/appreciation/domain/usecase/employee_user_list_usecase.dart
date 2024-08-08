 
import '../../../../core/core.dart';
import '../../appreciation.dart';

class EmployeeUserListUserCase extends UseCaseWithoutParams<EmployeeUserModel> {
  const EmployeeUserListUserCase(this._repository);

  final AppreciationRepository _repository;

  @override
  ResultFuture<EmployeeUserModel> call() {
    return _repository.employeeUserList();
  }
}
