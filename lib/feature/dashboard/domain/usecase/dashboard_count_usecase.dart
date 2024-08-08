import '../../../../core/core.dart';
import '../../dashboard.dart';

class DashboardCountUseCase extends UseCaseWithoutParams<DashboardCountModel> {
  const DashboardCountUseCase(this._repository);

  final DashboardRepository _repository;

  @override
  ResultFuture<DashboardCountModel> call() {
    return _repository.dashboardCount();
  }
}
