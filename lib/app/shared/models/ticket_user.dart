class TicketUser {
  final String firstName;
  final String lastName;
  final String avatar;

  TicketUser({
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory TicketUser.fromJson(Map<String, dynamic> json) {
    var {
      'first_name': firstName as String,
      'last_name': lastName as String,
      'avatar': avatar as String,
    } = json;

    return TicketUser(
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar
    };
  }}
