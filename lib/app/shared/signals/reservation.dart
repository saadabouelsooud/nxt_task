import 'package:signals/signals.dart';
import 'package:task/app/shared/models/reservation.dart';
import 'package:task/app/shared/services/api_service.dart';

final reservations = futureSignal(() => fetchReservations());
Future<List<Reservation>?> fetchReservations() async {
  final result = await ApiRepositoryImpl().fetchReservations();
  return result;
}
