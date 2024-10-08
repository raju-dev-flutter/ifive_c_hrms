import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../app/app.dart';
import '../../feature/feature.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => AuthenticationBloc(authenticationRepository: sl()))
    ..registerFactory(() => AuthBloc(login: sl(), changePassword: sl()))
    ..registerFactory(() => NavigationCubit())
    ..registerFactory(() => DashboardTabBarCubit())
    ..registerFactory(() => AppVersionCheckerCubit($AppVersionUseCase: sl()))
    ..registerFactory(() => DashboardCountCubit($DashboardCountUseCase: sl()))
    ..registerFactory(
        () => ApprovalLeaveHistoryCubit($ApprovalLeaveHistoryUseCase: sl()))
    ..registerFactory(() => AppreciationCubit(appreciationUseCase: sl()))
    ..registerFactory(() => AppreciationCrudBloc(appreciationRequest: sl()))
    ..registerFactory(() => RenewalTrackerCubit($RenewalTrackerUseCase: sl()))
    ..registerFactory(() => AttendanceStatusCubit(attendanceStatus: sl()))
    ..registerFactory(() => GPRSCheckerCubit($GPRSCheckerUseCase: sl()))
    ..registerFactory(
        () => AttendanceBloc(workStartLocation: sl(), workEndLocation: sl()))
    ..registerFactory(() => AttendanceReportCubit(
        getAttendanceUserList: sl(), attendanceReportList: sl()))
    ..registerFactory(() => FoodAttendanceBloc(updateFoodAttendance: sl()))
    ..registerFactory(
        () => FoodAttendanceStatusCubit(getFoodAttendanceStatus: sl()))
    ..registerFactory(
        () => FoodAttendanceReportCubit(getFoodAttendanceUserList: sl()))
    ..registerFactory(() => MisspunchCrudBloc(
        misspunchRequestSave: sl(),
        misspunchCancel: sl(),
        misspunchUpdate: sl()))
    ..registerFactory(() =>
        LeaveCrudBloc(leaveRequest: sl(), leaveCancel: sl(), leaveUpdate: sl()))
    ..registerFactory(() => LeaveHistoryCubit(leaveHistory: sl()))
    ..registerFactory(() => LeaveApprovedCubit(leaveApprovedUseCase: sl()))
    ..registerFactory(() => AccountDetailsCubit(profileDetail: sl()))
    ..registerFactory(() => AccountCrudBloc(
        profileUpload: sl(),
        profileEdit: sl(),
        $SkillUpdateUseCase: sl(),
        $SkillInsertUseCase: sl(),
        $ExperienceUseCase: sl(),
        $EducationUseCase: sl(),
        $ContactUseCase: sl(),
        $PersonalSaveUseCase: sl(),
        $TrainingCertificationUseCase: sl(),
        $VisaImmigrationUseCase: sl()))
    ..registerFactory(() => MisspunchHistoryCubit(getMisspunchHistory: sl()))
    ..registerFactory(
        () => MisspunchApprovedCubit(misspunchApprovedUseCase: sl()))
    ..registerFactory(() => PermissionCrudBloc(
        permissionSubmit: sl(), permissionUpdate: sl(), permissionCancel: sl()))
    ..registerFactory(() => PermissionHistoryCubit(permissionHistory: sl()))
    ..registerFactory(() => PermissionApprovalCubit(permissionApproval: sl()))
    ..registerFactory(() => PaySlipCubit($PaySlipUseCase: sl()))
    ..registerFactory(() => PaySlipDocumentCubit($PaySlipDocumentUseCase: sl()))
    ..registerFactory(() => TodayTaskCubit(todayTaskUseCase: sl()))
    ..registerFactory(() => StatusBasedTaskCubit(statusBasedTaskUseCase: sl()))
    ..registerFactory(() => TaskReportCubit(taskReportUseCase: sl()))

    /// Stream
    ..registerFactory(() => AttendanceStream($GPRSCheckerUseCase: sl()))
    ..registerFactory(() => ProfileEditStream())
    ..registerFactory(() => ProfileVisaImmigrationStream($CountryUseCase: sl()))
    ..registerFactory(() =>
        ProfileTrainingCertificationStream($CertificateLevelUseCase: sl()))
    ..registerFactory(() => ProfileSkillsStream(competencyLevelUseCase: sl()))
    ..registerFactory(() => ProfileExperienceStream())
    ..registerFactory(
        () => ProfileEducationStream($EducationLevelUseCase: sl()))
    ..registerFactory(() => ProfileBankStream())
    ..registerFactory(() => ProfilePersonalStream(
        $NationalityUseCase: sl(),
        $MotherTongueUseCase: sl(),
        $BloodGroupUseCase: sl()))
    ..registerFactory(() => ProfileContactStream(
        $CountryUseCase: sl(), $StateUseCase: sl(), $CityUseCase: sl()))
    ..registerFactory(() => AppreciationStream(employeeListUserCase: sl()))
    ..registerFactory(() => MissPunchRequestStream(
        getMisspunchForwardList: sl(), getMisspunchRequestList: sl()))
    ..registerFactory(() => ODPermissionRequestStream(
        getMisspunchForwardList: sl(),
        shiftTimeUseCase: sl(),
        oDBalanceUseCase: sl(),
        requestToUseCase: sl()))
    ..registerFactory(() => LeaveRequestStream(
        leaveType: sl(),
        remainingLeave: sl(),
        leaveMode: sl(),
        leaveForward: sl(),
        leaveBalanceCalculator: sl()))

    /// UseCases
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => ChangePassword(sl()))
    ..registerLazySingleton(() => DashboardCountUseCase(sl()))
    ..registerLazySingleton(() => ApprovalLeaveHistoryUseCase(sl()))
    ..registerLazySingleton(() => EmployeeUserListUserCase(sl()))
    ..registerLazySingleton(() => AppVersionUseCase(sl()))
    ..registerLazySingleton(() => GetAttendanceStatus(sl()))
    ..registerLazySingleton(() => AppreciationUseCase(sl()))
    ..registerLazySingleton(() => AppreciationRequest(sl()))
    ..registerLazySingleton(() => RenewalTrackerUseCase(sl()))
    ..registerLazySingleton(() => UpdateWorkStartLocation(sl()))
    ..registerLazySingleton(() => UpdateWorkEndLocation(sl()))
    ..registerLazySingleton(() => GetAttendanceUserList(sl()))
    ..registerLazySingleton(() => GPRSCheckerUseCase(sl()))
    ..registerLazySingleton(() => AppMenuUseCase(sl()))
    //
    ..registerLazySingleton(() => UpdateFoodAttendance(sl()))
    ..registerLazySingleton(() => GetFoodAttendanceStatus(sl()))
    ..registerLazySingleton(() => GetFoodAttendanceUserList(sl()))
    //
    ..registerLazySingleton(() => MisspunchRequestSave(sl()))
    ..registerLazySingleton(() => MisspunchCancel(sl()))
    ..registerLazySingleton(() => MisspunchUpdate(sl()))
    ..registerLazySingleton(() => GetMisspunchHistory(sl()))
    ..registerLazySingleton(() => GetMisspunchRequestList(sl()))
    ..registerLazySingleton(() => MisspunchApprovedUseCase(sl()))
    ..registerLazySingleton(() => GetMisspunchForwardList(sl()))
    ..registerLazySingleton(() => AttendanceReportList(sl()))
    ..registerLazySingleton(() => LeaveType(sl()))
    ..registerLazySingleton(() => RemainingLeave(sl()))
    ..registerLazySingleton(() => LeaveMode(sl()))
    ..registerLazySingleton(() => LeaveForward(sl()))
    ..registerLazySingleton(() => LeaveBalanceCalculator(sl()))
    ..registerLazySingleton(() => LeaveRequest(sl()))
    ..registerLazySingleton(() => LeaveCancel(sl()))
    ..registerLazySingleton(() => LeaveHistory(sl()))
    ..registerLazySingleton(() => LeaveUpdate(sl()))
    ..registerLazySingleton(() => ProfileDetail(sl()))
    ..registerLazySingleton(() => ProfileUpload(sl()))
    ..registerLazySingleton(() => ProfileEdit(sl()))
    ..registerLazySingleton(() => SkillUpdateUseCase(sl()))
    ..registerLazySingleton(() => SkillInsertUseCase(sl()))
    ..registerLazySingleton(() => ExperienceUseCase(sl()))
    ..registerLazySingleton(() => EducationUseCase(sl()))
    ..registerLazySingleton(() => ContactUseCase(sl()))
    ..registerLazySingleton(() => VisaImmigrationUseCase(sl()))
    ..registerLazySingleton(() => TrainingCertificationUseCase(sl()))
    ..registerLazySingleton(() => NationalityUseCase(sl()))
    ..registerLazySingleton(() => CertificateLevelUseCase(sl()))
    ..registerLazySingleton(() => MotherTongueUseCase(sl()))
    ..registerLazySingleton(() => BloodGroupUseCase(sl()))
    ..registerLazySingleton(() => PersonalSaveUseCase(sl()))
    ..registerLazySingleton(() => CompetencyLevelUseCase(sl()))
    ..registerLazySingleton(() => EducationLevelUseCase(sl()))
    ..registerLazySingleton(() => CountryUseCase(sl()))
    ..registerLazySingleton(() => StateUseCase(sl()))
    ..registerLazySingleton(() => CityUseCase(sl()))
    ..registerLazySingleton(() => LeaveApprovedUseCase(sl()))
    ..registerLazySingleton(() => PermissionSubmit(sl()))
    ..registerLazySingleton(() => PermissionHistory(sl()))
    ..registerLazySingleton(() => ShiftTimeUseCase(sl()))
    ..registerLazySingleton(() => ODBalanceUseCase(sl()))
    ..registerLazySingleton(() => RequestToUseCase(sl()))
    ..registerLazySingleton(() => PermissionUpdate(sl()))
    ..registerLazySingleton(() => PermissionApproval(sl()))
    ..registerLazySingleton(() => PermissionCancel(sl()))
    ..registerLazySingleton(() => PaySlipUseCase(sl()))
    ..registerLazySingleton(() => PaySlipDocumentUseCase(sl()))
    ..registerLazySingleton(() => TodayTaskUseCase(sl()))
    ..registerLazySingleton(() => StatusBasedTaskUseCase(sl()))
    ..registerLazySingleton(() => TaskReportUseCase(sl()))
    // ..registerLazySingleton(() => HolidayHistoryUseCase(sl()))
    // ..registerLazySingleton(() => LeavesHistoryUseCase(sl()))
    // ..registerLazySingleton(() => PresentHistoryUseCase(sl()))

    /// Repositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepository())
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(sl()))
    ..registerLazySingleton<DashboardRepository>(
        () => DashboardRepositoryImpl(sl()))
    ..registerLazySingleton<AttendanceRepository>(
        () => AttendanceRepositoryImpl(sl()))
    ..registerLazySingleton<AppreciationRepository>(
        () => AppreciationRepositoryImpl(sl()))
    ..registerLazySingleton<MisspunchRepository>(
        () => MisspunchRepositoryImpl(sl()))
    ..registerLazySingleton<LeaveRepository>(() => LeaveRepositoryImpl(sl()))
    ..registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()))
    ..registerLazySingleton<PayrollRepository>(
        () => PayrollRepositoryImpl(sl()))
    ..registerLazySingleton<AccountRepository>(
        () => AccountRepositoryImpl(sl()))
    ..registerLazySingleton<ODPermissionRepository>(
        () => ODPermissionRepositoryImpl(sl()))
    ..registerLazySingleton<OtherServiceRepository>(
        () => OtherServiceRepositoryImpl(sl()))
    ..registerLazySingleton<AssetsManagementRepository>(
        () => AssetsManagementRepositoryImpl(sl()))
    // ..registerLazySingleton<CalendarRepository>(
    //     () => CalendarRepositoryImpl(sl()))

    /// DataSource
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(sl()))
    ..registerLazySingleton<FoodDataSource>(() => FoodDataSourceImpl(sl()))
    ..registerLazySingleton<DashboardDataSource>(
        () => DashboardDataSourceImpl(sl()))
    ..registerLazySingleton<AttendanceDataSource>(
        () => AttendanceDataSourceImpl(sl()))
    ..registerLazySingleton<AppreciationDataSource>(
        () => AppreciationDataSourceImpl(sl()))
    ..registerLazySingleton<MisspunchDataSource>(
        () => MisspunchDataSourceImpl(sl()))
    ..registerLazySingleton<LeaveDataSource>(() => LeaveDataSourceImpl(sl()))
    ..registerLazySingleton<TaskDataSource>(() => TaskDataSourceImpl(sl()))
    ..registerLazySingleton<PayrollDataSource>(
        () => PayrollDataSourceImpl(sl()))
    ..registerLazySingleton<AccountDataSource>(
        () => AccountDataSourceImpl(sl()))
    ..registerLazySingleton<ODPermissionDataSource>(
        () => ODPermissionDataSourceImpl(sl()))
    ..registerLazySingleton<OtherServiceDataSource>(
        () => OtherServiceDataSourceImpl(sl()))
    ..registerLazySingleton<AssetsManagementDataSource>(
        () => AssetsManagementDataSourceImpl(sl()))
    // ..registerLazySingleton<CalendarDataSource>(
    //     () => CalendarDataSourceImpl(sl()))

    /// External Dependencies
    ..registerLazySingleton(http.Client.new);
}
