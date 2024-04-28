part of '../reservation_page.dart';

class _ImageGallery extends StatelessWidget {
  const _ImageGallery({required this.reservation});

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10.0),
      height: context.ratioHeight(225),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reservation.stays.first.stayImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: context.ratioWidth(150),
            margin: const EdgeInsetsDirectional.only(end: 6.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  reservation.stays.first.stayImages[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}