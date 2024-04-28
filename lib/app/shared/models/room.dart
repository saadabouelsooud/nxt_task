import 'package:task/app/shared/models/ticket_user.dart';

class Room {
  final String roomNumber;
  final int roomCapacity;
  final String roomTypeName;
  final String stayName;
  final List<TicketUser> guests;

  Room({
    required this.roomNumber,
    required this.roomCapacity,
    required this.roomTypeName,
    required this.stayName,
    required this.guests,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    var {
      'room_number': roomNumber as String,
      'room_capacity': roomCapacity as int,
      'room_type_name': roomTypeName as String,
      'stay_name': stayName as String,
      'guests': guests as List<dynamic>,
    } = json;

    return Room(
      roomNumber: roomNumber,
      roomCapacity: roomCapacity,
      roomTypeName: roomTypeName,
      stayName: stayName,
      guests: List<TicketUser>.from(guests.map((x) => TicketUser.fromJson(x))),
    );
  }
}
