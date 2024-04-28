import 'package:task/app/shared/models/ticket_user.dart';

class Ticket {
  final int ticketId;
  final String seat;
  final String ticketSystemId;
  final String ticketTypeName;
  final TicketUser ticketUser;
  final String gate;

  Ticket({
    required this.ticketId,
    required this.seat,
    required this.ticketSystemId,
    required this.ticketTypeName,
    required this.ticketUser,
    required this.gate,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    var {
      'ticket_id': ticketId as int,
      'seat': seat as String,
      'ticket_system_id': ticketSystemId as String,
      'ticket_type_name': ticketTypeName as String,
      'ticket_user_data': ticketUserData as Map<String, dynamic>,
      'gate': gate as String,
    } = json;

    return Ticket(
      ticketId: ticketId,
      seat: seat,
      ticketSystemId: ticketSystemId,
      ticketTypeName: ticketTypeName,
      ticketUser: TicketUser.fromJson(ticketUserData),
      gate: gate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticket_id': ticketId,
      'seat': seat,
      'ticket_system_id': ticketSystemId,
      'ticket_type_name': ticketTypeName,
      'ticket_user_data': ticketUser.toJson(),
      'gate': gate
      // Add other properties to the JSON map
    };
  }}
