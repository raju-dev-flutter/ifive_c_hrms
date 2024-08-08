import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../task.dart';

class TaskInProgressScreen extends StatefulWidget {
  const TaskInProgressScreen({super.key});

  @override
  State<TaskInProgressScreen> createState() => _TaskInProgressScreenState();
}

class _TaskInProgressScreenState extends State<TaskInProgressScreen> {
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
          title: "Task In-Progress",
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
            itemBuilder: (_, i) => $InProgressTaskCardUI(task[i]),
          );
        }
        return Container();
      },
    );
  }

  Widget $InProgressTaskCardUI(TaskPlanner task) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4).w,
      child: Container(
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius: Dimensions.kBorderRadiusAllSmaller,
        ),
        child: Column(
          children: [
            Padding(
              padding: Dimensions.kPaddingAllSmall,
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
                          color: appColor.blue600,
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
                          Container(
                            width: 46.w,
                            height: 46.h,
                            child: CircularProgressIndicator(
                              value: 40 / 100,
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
                            "40%",
                            style: context.textTheme.labelMedium?.copyWith(
                                color: appColor.gray500,
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
            const Divider(height: 0),
            Padding(
              padding: Dimensions.kPaddingAllSmall,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  badge(color: appColor.blue600, label: "ST: 10:15 AM"),
                ],
              ),
            ),
          ],
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
