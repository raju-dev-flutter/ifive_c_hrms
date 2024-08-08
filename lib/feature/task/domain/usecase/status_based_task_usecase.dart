import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';

class StatusBasedTaskUseCase
    extends UseCaseWithParams<TaskPlannerModel, StatusBasedTaskParams> {
  const StatusBasedTaskUseCase(this._repository);

  final TaskRepository _repository;

  @override
  ResultFuture<TaskPlannerModel> call(StatusBasedTaskParams params) {
    return _repository.statusBasedTask(params.status);
  }
}

class StatusBasedTaskParams extends Equatable {
  final String status;

  const StatusBasedTaskParams(this.status);

  @override
  List<Object?> get props => [status];
}
