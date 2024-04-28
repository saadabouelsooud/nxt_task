part of '../reservation_page.dart';

class _TicketWidget extends StatelessWidget {
  const _TicketWidget({required this.reservation});

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      height: 150,
      width: double.infinity,
      radius: 30,
      topChild: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        color: context.colorScheme.outline.withOpacity(.35),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colorScheme.background,
                width: 1,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  reservation.userTickets?.first.ticketUser.avatar ??
                      'https://s3-alpha-sig.figma.com/img/5412/a2bc/c1a0b62fe5e42bf0f9af1ac1d77a35ab?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lf8cBIY65OfA5QgRItcpGSSFHxZihoLyACrPdyQLg3G2BB8EEBlS4~uYFyWzAsjM4iD6lV9Jx0NIcuMgvNn5cQDBWgNtb~mCzQOkK5aiHhOY~eNYArZ8gdaAPr-NYAZ9egv4YRQfLPxqmuM70BNnDB0yifLPsmwx3RVDkLY7fR~fVKE8JmtvjBx6cikISs0K5ktSTeVmbczXag5~VqnCTJ~-4RoTevU7UQ1bBDjWxFO3vakDc8ZBaiVAkjMWiVXGCa23eLCbY7aaypgWT5U-UKnaq5udvHqGAGuMdixFA38MWNBmJY9zrp6Knb9OFOEcut9S5y6vESvyJe64XPbV3w__',
                ),
              ),
            ),
          ),
          title: Text(
            reservation.userTickets?.first.ticketUser.firstName ??
                'Marilyn Bridges James',
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            '#${reservation.userTickets?.first.ticketSystemId ?? '170122708123'}',
            style: context.textTheme.labelSmall,
          ),
        ),
      ),
      bottomChild: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        color: context.colorScheme.outline.withOpacity(.35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ticket Type: ${reservation.userTickets?.first.ticketTypeName ?? 'MATCH Business Seat'}',
              style: context.textTheme.labelSmall,
            ),
            Text(
              'Seat: ${reservation.userTickets?.first.seat ?? 'Block 112 / Row S / Seat 1'}',
              style: context.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
