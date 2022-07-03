import 'package:intl/intl.dart';
import 'package:schedule_app/shared/models/address_model.dart';

String formatDayAndMonth(DateTime now) {
  return DateFormat('dd/MM').format(now);
}

String formatDayMonthYear(DateTime now) {
  return DateFormat('dd/MM/yy').format(now);
}

String formatHour(DateTime now) {
  return DateFormat('kk:mm').format(now);
}

String formatDay(DateTime now) {
  final result = DateFormat('EEEE').format(now);
  return result.substring(0, 3).toUpperCase();
}

String formatedAddress(AddressModel address) =>
    '${address.street}, ${address.number}, ${address.neighborhood},\n${address.city}-${address.uf}';
