import 'package:flutter/material.dart';

import '../../feature/feature.dart';
import '../config.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /* ========= Profile Route ============= */
      case AppRouterPath.profileEditScreen:
        final arg = settings.arguments as ProfileEditScreen;
        return MaterialPageRoute(
            builder: (_) => ProfileEditScreen(profile: arg.profile));

      case AppRouterPath.profileUpdateOfficeScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateOfficeScreen());

      case AppRouterPath.profilePersonalDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfilePersonalDetailsScreen());

      case AppRouterPath.profileUpdatePersonalScreen:
        final arg = settings.arguments as ProfileUpdatePersonalScreen;
        return MaterialPageRoute(
            builder: (_) =>
                ProfileUpdatePersonalScreen(personal: arg.personal));

      case AppRouterPath.profileUpdateContactScreen:
        final arg = settings.arguments as ProfileUpdateContactScreen;
        return MaterialPageRoute(
            builder: (_) => ProfileUpdateContactScreen(contact: arg.contact));

      case AppRouterPath.profileContactDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileContactDetailsScreen());

      case AppRouterPath.profileUpdateBankScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateBankScreen());

      case AppRouterPath.profileUpdateEducationScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateEducationScreen());

      case AppRouterPath.profileUpdateExperienceScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateExperienceScreen());

      case AppRouterPath.profileUpdateSkillsScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateSkillsScreen());

      case AppRouterPath.profileUpdateTrainingCertificationScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateTrainingCertificationScreen());

      case AppRouterPath.profileUpdateVisaImmigrationScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileUpdateVisaImmigrationScreen());

      /* ========= Attendance Route ============= */
      case AppRouterPath.attendance:
        return MaterialPageRoute(builder: (_) => const AttendanceScreen());

      case AppRouterPath.attendanceReport:
        return MaterialPageRoute(
            builder: (_) => const AttendanceReportScreen());

      case AppRouterPath.attendanceEmployeeDetailScreen:
        final arg = settings.arguments as AttendanceEmployeeDetailScreen;
        return MaterialPageRoute(
            builder: (_) =>
                AttendanceEmployeeDetailScreen(attendance: arg.attendance));

      /* ========= Food Attendance Route ============= */
      case AppRouterPath.foodAttendance:
        return MaterialPageRoute(builder: (_) => const FoodAttendanceScreen());

      case AppRouterPath.foodAttendanceReport:
        return MaterialPageRoute(
            builder: (_) => const FoodAttendanceReportScreen());

      /* ========= Leave Route ============= */
      case AppRouterPath.leaveRequest:
        return MaterialPageRoute(builder: (_) => const LeaveRequestScreen());

      case AppRouterPath.leaveHistory:
        return MaterialPageRoute(builder: (_) => const LeaveHistoryScreen());

      case AppRouterPath.leaveCancel:
        final arg = settings.arguments as LeaveCancelScreen;
        return MaterialPageRoute(
            builder: (_) => LeaveCancelScreen(leave: arg.leave));

      case AppRouterPath.leaveUpdate:
        final arg = settings.arguments as LeaveUpdateScreen;
        return MaterialPageRoute(
            builder: (_) => LeaveUpdateScreen(leave: arg.leave));

      case AppRouterPath.leaveScreen:
        return MaterialPageRoute(builder: (_) => const LeaveScreen());

      case AppRouterPath.leaveApproval:
        return MaterialPageRoute(builder: (_) => const LeaveApprovalScreen());

      /* ========= Misspunch Route ============= */
      case AppRouterPath.misspunchRequest:
        return MaterialPageRoute(
            builder: (_) => const MisspunchRequestScreen());

      case AppRouterPath.misspunch:
        return MaterialPageRoute(builder: (_) => const MisspunchScreen());

      case AppRouterPath.misspunchCancel:
        final arg = settings.arguments as MisspunchCancelScreen;
        return MaterialPageRoute(
            builder: (_) => MisspunchCancelScreen(missPunch: arg.missPunch));

      case AppRouterPath.misspunchUpdate:
        final arg = settings.arguments as MisspunchUpdateScreen;
        return MaterialPageRoute(
            builder: (_) => MisspunchUpdateScreen(missPunch: arg.missPunch));

      /* ========= OD Permission Route ============= */
      case AppRouterPath.oDPermissionRequestScreen:
        return MaterialPageRoute(
            builder: (_) => const ODPermissionRequestScreen());

      case AppRouterPath.oDPermissionScreen:
        return MaterialPageRoute(builder: (_) => const ODPermissionScreen());

      case AppRouterPath.oDPermissionUpdateScreen:
        final arg = settings.arguments as ODPermissionUpdateScreen;
        return MaterialPageRoute(
            builder: (_) =>
                ODPermissionUpdateScreen(permission: arg.permission));

      case AppRouterPath.oDPermissionCancelScreen:
        final arg = settings.arguments as ODPermissionCancelScreen;
        return MaterialPageRoute(
            builder: (_) =>
                ODPermissionCancelScreen(permission: arg.permission));

      /* ========= Payroll Route ============= */

      case AppRouterPath.payrollScreen:
        return MaterialPageRoute(builder: (_) => const PayrollScreen());

      case AppRouterPath.payrollDetailsScreen:
        final arg = settings.arguments as PayrollDetailsScreen;
        return MaterialPageRoute(
            builder: (_) => PayrollDetailsScreen(paySlipId: arg.paySlipId));

      /* ========= Task Route ============= */

      case AppRouterPath.taskInitiatedScreen:
        return MaterialPageRoute(builder: (_) => const TaskInitiatedScreen());

      case AppRouterPath.taskPendingScreen:
        return MaterialPageRoute(builder: (_) => const TaskPendingScreen());

      case AppRouterPath.taskInProgressScreen:
        return MaterialPageRoute(builder: (_) => const TaskInProgressScreen());

      case AppRouterPath.taskTestL1Screen:
        return MaterialPageRoute(builder: (_) => const TaskTestL1Screen());

      case AppRouterPath.taskTestL2Screen:
        return MaterialPageRoute(builder: (_) => const TaskTestL2Screen());

      case AppRouterPath.taskCompletedScreen:
        return MaterialPageRoute(builder: (_) => const TaskCompletedScreen());

      case AppRouterPath.taskCompletedDetailScreen:
        return MaterialPageRoute(
            builder: (_) => const TaskCompletedDetailScreen());

      /* ========= Change Password Route ============= */

      case AppRouterPath.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      /* ========= Appreciation Route ============= */

      case AppRouterPath.appreciationScreen:
        return MaterialPageRoute(builder: (_) => const AppreciationScreen());

      /* ========= Renewal Tracking Route ============= */

      case AppRouterPath.renewalTrackingScreen:
        return MaterialPageRoute(builder: (_) => const RenewalTrackingScreen());

      /* ========= Dashboard Leave Approval Route ============= */

      case AppRouterPath.dashboardLeaveApprovalScreen:
        return MaterialPageRoute(
            builder: (_) => const DashboardLeaveApprovalScreen());

      /* ========= Asset Management Route ============= */

      case AppRouterPath.assetManagementScreen:
        return MaterialPageRoute(builder: (_) => const AssetManagementScreen());

      /* ========= No Route view ============= */
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(body: Center(child: Text('No route defined')));
        });
    }
  }
}
