import 'package:task/app/shared/helpers/dio_helper.dart';
import 'package:task/app/shared/models/reservation.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiClient _apiClient;
  ApiRepositoryImpl() : _apiClient = ApiClient(DioClient.instance.dio);

  @override
  Future<List<Reservation>> fetchReservations() async {
    final response = await _apiClient.get(
      'https://qa-testing-backend-293b1363694d.herokuapp.com//api/v3/mobile-guests/user-events',
    );
    return List<Reservation>.from(
      response.data['reservations'].map((x) => Reservation.fromJson(x)),
    );
  }
}

abstract class ApiRepository {
  Future<List<Reservation>> fetchReservations();
}
