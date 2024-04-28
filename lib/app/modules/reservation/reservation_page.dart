import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';
import 'package:task/app/shared/components/dashed_divider.dart';
import 'package:task/app/shared/components/shimmer.dart';
import 'package:task/app/shared/components/ticket.dart';
import 'package:task/app/shared/extensions/context.dart';
import 'package:task/app/shared/models/reservation.dart';
import 'package:task/app/shared/models/room.dart';
import 'package:task/app/shared/models/stay.dart';
import 'package:task/app/shared/signals/reservation.dart';

part 'components/image_gallery.dart';
part 'components/location_widget.dart';
part 'components/room_widget.dart';
part 'components/stars_widget.dart';
part 'components/ticket_widget.dart';
part 'components/loading_shimmer.dart';

class BottomSheetPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      modalBarrierColor: Colors.transparent,
      showDragHandle: true,
      settings: this,
      isScrollControlled: true,
      builder: (context) => const ModalBottomSheet(),
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch.builder(
      builder: (context) {
        if (reservations.value.isLoading) return const _LoadingContent();

        final reservation = reservations.requireValue!.last;
        final stay = reservation.stays.first;
        return Container(
          color: context.colorScheme.background,
          height: context.height - kToolbarHeight * 2,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OverflowBox(
                  fit: OverflowBoxFit.deferToChild,
                  maxWidth: context.width,
                  child: Image.network(
                    stay.stayImages.first,
                    height: context.ratioHeight(300),
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Hotel Check-in',
                    style: context.textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    'Check-in to your hotel',
                    style: context.textTheme.labelSmall,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'From',
                          style: context.textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          DateFormat('MMM d, y').format(reservation.startDate),
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Till',
                          style: context.textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          DateFormat('MMM d, y').format(reservation.endDate),
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Stars',
                          style: context.textTheme.titleMedium,
                        ),
                        subtitle: _StarsRow(stars: stay.stars),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Room Count',
                          style: context.textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          stay.rooms.length.toString(),
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  'Location:',
                  style: context.textTheme.titleMedium,
                ),
                _LocationWidget(stay: stay),
                const SizedBox(height: 40),
                Text(
                  'Tickets:',
                  style: context.textTheme.titleMedium,
                ),
                _TicketWidget(reservation: reservation),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                  child: const DashedDivider(),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: reservation.stays.first.rooms.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 40.0),
                      child: const DashedDivider(),
                    );
                  },
                  itemBuilder: (context, index) {
                    final room = reservation.stays.first.rooms[index];
                    return _RoomWidget(room: room, number: ++index);
                  },
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                  child: const DashedDivider(),
                ),
                Text(
                  'Gallery:',
                  style: context.textTheme.titleMedium,
                ),
                _ImageGallery(reservation: reservation),
                const SizedBox(height: 40),
                ListTile(
                  title: Text(
                    'Amenities',
                    style: context.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    reservation.stays.first.amenities,
                    style: context.textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
