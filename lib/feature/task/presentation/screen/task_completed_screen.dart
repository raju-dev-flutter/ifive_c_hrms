import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../task.dart';

class TaskCompletedScreen extends StatefulWidget {
  const TaskCompletedScreen({super.key});

  @override
  State<TaskCompletedScreen> createState() => _TaskCompletedScreenState();
}

class _TaskCompletedScreenState extends State<TaskCompletedScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    initialCallBack();
  }

  Future<void> initialCallBack() async {
    BlocProvider.of<StatusBasedTaskCubit>(context)
        .statusBasedTask(status: "Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appColor.gray100,
      appBar: PreferredSize(
        preferredSize: Size(context.deviceSize.width, 52.h),
        child: CustomAppBar(
          onPressed: () => Navigator.pop(context),
          title: "Task Completed",
        ),
      ),
      body: _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return BlocBuilder<StatusBasedTaskCubit, StatusBasedTaskState>(
      builder: (context, state) {
        if (state is StatusBasedTaskLoaded) {
          final task = state.taskPlannerModel.taskPlanner;
          if (task!.isEmpty) return Container();
          return ListView.builder(
            itemCount: task.length,
            padding: Dimensions.kPaddingAllMedium,
            itemBuilder: (_, i) => $CompletedTaskCardUI(task[i]),
          );
        }
        return Container();
      },
    );
  }

  Widget $CompletedTaskCardUI(TaskPlanner task) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4).w,
      child: InkWell(
        // onTap: () => Navigator.pushNamed(
        //     context, AppRouterPath.taskCompletedDetailScreen),
        borderRadius: Dimensions.kBorderRadiusAllSmaller,
        child: Container(
          padding: Dimensions.kPaddingAllMedium,
          decoration: BoxDecoration(
            color: appColor.white,
            borderRadius: Dimensions.kBorderRadiusAllSmaller,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  badge(
                      color: appColor.warning500,
                      label: (task.priority ?? "").toUpperCase()),
                  Dimensions.kHorizontalSpaceSmaller,
                  badge(
                      color: appColor.success600,
                      label: (task.status ?? "").toUpperCase()),
                  Dimensions.kSpacer,
                  Icon(Icons.more_vert_rounded,
                      size: 18.w, color: appColor.gray700),
                ],
              ),
              Dimensions.kVerticalSpaceSmaller,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.task ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Dimensions.kVerticalSpaceSmallest,
                        Text(
                          task.description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium
                              ?.copyWith(color: appColor.gray500),
                        ),
                      ],
                    ),
                  ),
                  Dimensions.kHorizontalSpaceSmaller,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 46.w,
                        height: 46.h,
                        child: CircularProgressIndicator(
                          value: int.parse(task.percentage ?? '0') / 100,
                          backgroundColor: appColor.gray100,
                          color: appColor.gray100,
                          valueColor: AlwaysStoppedAnimation<Color?>(
                              appColor.success600),
                          strokeWidth: 10,
                          strokeCap: StrokeCap.butt,
                        ),
                      ),
                      Positioned(
                          child: Text(
                        "${task.percentage ?? ''} %",
                        style: context.textTheme.labelSmall?.copyWith(
                            color: appColor.gray600,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ],
              ),
              Dimensions.kVerticalSpaceSmaller,
              Row(
                children: [
                  SvgPicture.asset(
                    AppSvg.time,
                    width: 12.w,
                    colorFilter:
                        ColorFilter.mode(appColor.gray500, BlendMode.srcIn),
                  ),
                  Dimensions.kHorizontalSpaceSmaller,
                  Text(
                    task.taskDate ?? '',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: appColor.gray500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget badge({Color? color, required String label}) {
    return Container(
      padding: Dimensions.kPaddingAllSmaller,
      decoration: BoxDecoration(
        color: (color ?? appColor.blue100).withOpacity(.2),
        borderRadius: Dimensions.kBorderRadiusAllSmallest,
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
            color: color ?? appColor.blue100, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TaskCompletedDetailScreen extends StatefulWidget {
  const TaskCompletedDetailScreen({super.key});

  @override
  State<TaskCompletedDetailScreen> createState() =>
      _TaskCompletedDetailScreenState();
}

class _TaskCompletedDetailScreenState extends State<TaskCompletedDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appColor.white,
      appBar: PreferredSize(
        preferredSize: Size(context.deviceSize.width, 52.h),
        child: CustomAppBar(
          onPressed: () => Navigator.pop(context),
          title: "Task Completed Details",
        ),
      ),
      body: _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return Container(
      padding: Dimensions.kPaddingAllMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem ipsum is placeholder.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Dimensions.kVerticalSpaceSmallest,
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style:
                context.textTheme.labelLarge?.copyWith(color: appColor.gray500),
          ),
          Dimensions.kVerticalSpaceSmall,
          taskProperty(
            icon: Icons.people,
            label: 'Assigned',
            value: 'Superadmin',
          ),
          Dimensions.kVerticalSpaceSmaller,
          taskProperty(
            icon: Icons.timeline,
            label: 'Timeline',
            value: '28 Mar 2024',
          ),
          Dimensions.kVerticalSpaceSmaller,
          taskProperty(
            icon: Icons.task,
            label: 'Project Type',
            value: 'Task',
          ),
          Dimensions.kVerticalSpaceSmaller,
          taskProperty(
            icon: Icons.low_priority_rounded,
            label: 'Priority',
            value: 'High',
          ),
          Dimensions.kVerticalSpaceSmaller,
          taskProperty(
            icon: Icons.percent_rounded,
            label: 'Status',
            value: 'Completed',
          ),
          // Dimensions.kVerticalSpaceMedium,
          // Row(
          //   children: [
          //     Container(
          //       width: 46.w,
          //       height: 46.h,
          //       decoration: BoxDecoration(
          //         borderRadius: Dimensions.kBorderRadiusAllLarger,
          //         color: appColor.gray100,
          //       ),
          //     ),
          //     Dimensions.kHorizontalSpaceSmaller,
          //     // badge(color: appColor.success600, label: "Completed"),
          //   ],
          // ),
          // Dimensions.kVerticalSpaceSmaller,
        ],
      ),
    );
  }

  Widget badge({Color? color, required String label}) {
    return Container(
      padding: Dimensions.kPaddingAllSmaller,
      decoration: BoxDecoration(
        color: (color ?? appColor.blue100).withOpacity(.2),
        borderRadius: Dimensions.kBorderRadiusAllSmallest,
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
            color: color ?? appColor.blue100, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget taskProperty(
      {required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Icon(icon, size: 16.w),
              Dimensions.kHorizontalSpaceSmaller,
              Text(label, style: context.textTheme.labelLarge),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: context.textTheme.labelLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
