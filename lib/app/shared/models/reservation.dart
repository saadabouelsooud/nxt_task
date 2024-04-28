import 'dart:convert';

import 'package:task/app/shared/models/stay.dart';
import 'package:task/app/shared/models/ticket.dart';

class Reservation {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final List<Stay> stays;
  final List<Ticket>? userTickets;

  Reservation({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.stays,
    required this.userTickets,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    var {
      'id': id,
      'start_date': startDate,
      'end_date': endDate,
      'stays': stays,
    } = json;

    final userTickets = json['user_tickets'];

    return Reservation(
      id: id,
      startDate: DateTime.parse(startDate),
      endDate: DateTime.parse(endDate),
      stays: List<Stay>.from(stays.map((x) => Stay.fromJson(x))),
      userTickets: userTickets == null
          ? null
          : List<Ticket>.from(userTickets.map((x) => Ticket.fromJson(x))),
    );
  }

  @override
  String toString() {
    String jsonFirstTicket = jsonEncode(userTickets?[0].toJson());
    return jsonFirstTicket;
    // return '{ "id": $id, "start_date": "$startDate", "end_date": "$endDate", "stays": ${stays.length}, "userTickets": $jsonFirstTicket}';
  }
}
