part of '../reservation_page.dart';

class _RoomWidget extends StatelessWidget {
  final int number;
  const _RoomWidget({required this.room, required this.number});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Room Reservation $number',
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        Text(
          'Guest(s):',
          style: context.textTheme.titleMedium,
        ),
        ListView.builder(
          itemCount: room.guests.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            final guest = room.guests[index];
            return ListTile(
              title: Text(
                '${guest.firstName} ${guest.lastName}',
                style: context.textTheme.titleMedium,
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(guest.avatar),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ListTile(
          title: Text(
            'Room Type',
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            room.roomTypeName,
            style: context.textTheme.labelSmall,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  'Room Number',
                  style: context.textTheme.titleMedium,
                ),
                subtitle: Text(
                  room.roomNumber,
                  style: context.textTheme.labelSmall,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'Sleeps',
                  style: context.textTheme.titleMedium,
                ),
                subtitle: Text(
                  room.roomCapacity.toString(),
                  style: context.textTheme.labelSmall,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
