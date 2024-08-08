class TaskPlannerModel {
  List<TaskPlanner>? taskPlanner;

  TaskPlannerModel({this.taskPlanner});

  TaskPlannerModel.fromJson(Map<String, dynamic> json) {
    if (json['taskplanner'] != null) {
      taskPlanner = <TaskPlanner>[];
      json['taskplanner'].forEach((v) {
        taskPlanner!.add(TaskPlanner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (taskPlanner != null) {
      data['taskplanner'] = taskPlanner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskPlanner {
  int? taskPlannerId;
  String? foreignId;
  String? lineNo;
  String? projectId;
  String? seqId;
  String? menu;
  String? task;
  String? taskDate;
  String? type;
  String? targetDate;
  int? taskGivenBy;
  String? actualComplectionDate;
  int? delivaryTeam;
  String? seqTask;
  String? description;
  String? reference;
  String? priority;
  String? level;
  String? duration;
  String? startTime;
  String? endTime;
  String? timeTaken;
  String? status;
  String? assignTo;
  String? testedBy;
  String? discuss;
  String? delivaryTeamRemarks;
  String? createdBy;
  int? companyId;
  int? locationId;
  String? team;
  String? reworkRemarks;
  String? support;
  String? supportDuration;
  dynamic percentage;

  TaskPlanner(
      {this.taskPlannerId,
      this.foreignId,
      this.lineNo,
      this.projectId,
      this.seqId,
      this.menu,
      this.task,
      this.taskDate,
      this.type,
      this.targetDate,
      this.taskGivenBy,
      this.actualComplectionDate,
      this.delivaryTeam,
      this.seqTask,
      this.description,
      this.reference,
      this.priority,
      this.level,
      this.duration,
      this.startTime,
      this.endTime,
      this.timeTaken,
      this.status,
      this.assignTo,
      this.testedBy,
      this.discuss,
      this.delivaryTeamRemarks,
      this.createdBy,
      this.companyId,
      this.locationId,
      this.team,
      this.reworkRemarks,
      this.support,
      this.supportDuration,
      this.percentage});

  TaskPlanner.fromJson(Map<String, dynamic> json) {
    taskPlannerId = json['taskplanner_id'];
    foreignId = json['foreign_id'];
    lineNo = json['line_no'];
    projectId = json['project_id'];
    seqId = json['seq_id'];
    menu = json['menu'];
    task = json['task'];
    taskDate = json['task_date'];
    type = json['type'];
    targetDate = json['target_date'];
    taskGivenBy = json['task_given_by'];
    actualComplectionDate = json['actual_complection_date'];
    delivaryTeam = json['delivary_team'];
    seqTask = json['seq_task'];
    description = json['description'];
    reference = json['reference'];
    priority = json['priority'];
    level = json['level'];
    duration = json['duration'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    timeTaken = json['time_taken'];
    status = json['status'];
    assignTo = json['assign_to'];
    testedBy = json['tested_by'];
    discuss = json['discuss'];
    delivaryTeamRemarks = json['delivary_team_remarks'];
    createdBy = json['created_by'];
    companyId = json['company_id'];
    locationId = json['location_id'];
    team = json['team'];
    reworkRemarks = json['rework_remarks'];
    support = json['support'];
    supportDuration = json['support_duration'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taskplanner_id'] = taskPlannerId;
    data['foreign_id'] = foreignId;
    data['line_no'] = lineNo;
    data['project_id'] = projectId;
    data['seq_id'] = seqId;
    data['menu'] = menu;
    data['task'] = task;
    data['task_date'] = taskDate;
    data['type'] = type;
    data['target_date'] = targetDate;
    data['task_given_by'] = taskGivenBy;
    data['actual_complection_date'] = actualComplectionDate;
    data['delivary_team'] = delivaryTeam;
    data['seq_task'] = seqTask;
    data['description'] = description;
    data['reference'] = reference;
    data['priority'] = priority;
    data['level'] = level;
    data['duration'] = duration;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['time_taken'] = timeTaken;
    data['status'] = status;
    data['assign_to'] = assignTo;
    data['tested_by'] = testedBy;
    data['discuss'] = discuss;
    data['delivary_team_remarks'] = delivaryTeamRemarks;
    data['created_by'] = createdBy;
    data['company_id'] = companyId;
    data['location_id'] = locationId;
    data['team'] = team;
    data['rework_remarks'] = reworkRemarks;
    data['support'] = support;
    data['support_duration'] = supportDuration;
    data['percentage'] = percentage;
    return data;
  }
}
