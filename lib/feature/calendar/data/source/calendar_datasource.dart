import '../../calendar.dart';

abstract class CalendarDataSource {
  Future<HolidayHistoryModel> holidayHistory();

  Future<LeavesHistoryModel> leavesHistory();

  Future<PresentHistoryModel> presentHistory(String fromDate, String toDate);
}
