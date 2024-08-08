import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';

class TaskTestL1Screen extends StatefulWidget {
  const TaskTestL1Screen({super.key});

  @override
  State<TaskTestL1Screen> createState() => _TaskTestL1ScreenState();
}

class _TaskTestL1ScreenState extends State<TaskTestL1Screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appColor.gray100,
      appBar: PreferredSize(
        preferredSize: Size(context.deviceSize.width, 52.h),
        child: CustomAppBar(
          onPressed: () => Navigator.pop(context),
          title: "Task Test Level 1",
        ),
      ),
      body: _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return ListView.builder(
      itemCount: 3,
      padding: Dimensions.kPaddingAllMedium,
      itemBuilder: (_, i) {
        return $TestL1TaskCardUI();
      },
    );
  }

  Widget $TestL1TaskCardUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4).w,
      child: Container(
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius: Dimensions.kBorderRadiusAllSmaller,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Dimensions.kPaddingAllMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      badge(color: appColor.warning500, label: "High"),
                      Dimensions.kHorizontalSpaceSmaller,
                      badge(color: appColor.purple600, label: "Test Level 1"),
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
                              'Lorem ipsum is placeholder.',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Dimensions.kVerticalSpaceSmallest,
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
                        DateFormat("yyyy-MM-dd hh:mm a").format(selectedDate),
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
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 4,
                runSpacing: 4,
                children: [
                  badge(color: appColor.blue600, label: "ST: 10:15 AM"),
                  // Dimensions.kHorizontalSpaceSmallest,
                  badge(color: appColor.blue600, label: "ET: 12:06 PM"),
                  // Dimensions.kHorizontalSpaceSmallest,
                  badge(color: appColor.blue600, label: "TL1-ST: 12:06 PM"),
                  // badge(color: appColor.blue600, label: "TL1-ET: 12:06 PM"),
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
