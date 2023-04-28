import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension TimeFormatter on int {
  String toWeekDateMonthYear() {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final formattedDate = DateFormat('EEEE, MMM d, yyyy','uz').format(now);
    return formattedDate;
  }
}
