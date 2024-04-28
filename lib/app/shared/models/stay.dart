import 'package:task/app/shared/models/room.dart';

class Stay {
  final String name;
  final String description;
  final String lat;
  final String lng;
  final String address;
  final String checkIn;
  final String checkOut;
  final int stars;
  final List<String> stayImages;
  final String amenities;
  final List<Room> rooms;

  Stay({
    required this.name,
    required this.description,
    required this.lat,
    required this.lng,
    required this.address,
    required this.checkIn,
    required this.checkOut,
    required this.stars,
    required this.stayImages,
    required this.amenities,
    required this.rooms,
  });

  factory Stay.fromJson(Map<String, dynamic> json) {
    var {
      'name': name as String,
      'description': description as String,
      'lat': lat as String,
      'lng': lng as String?,
      'address': address as String,
      'check_in': checkIn as String,
      'check_out': checkOut as String,
      'stars': stars as int,
      'stay_images': stayImages as List<dynamic>,
      'amenities': amenities as String,
      'rooms': rooms as List<dynamic>,
    } = json;

    return Stay(
      name: name,
      description: description,
      lat: lat,
      lng: lng ?? lat,
      address: address,
      checkIn: checkIn,
      checkOut: checkOut,
      stars: stars,
      stayImages: List<String>.from(stayImages.map((x) => x as String)),
      amenities: amenities,
      rooms: List<Room>.from(rooms.map((x) => Room.fromJson(x))),
    );
  }
}
