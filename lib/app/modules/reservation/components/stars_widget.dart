part of '../reservation_page.dart';

class _StarsRow extends StatelessWidget {
  const _StarsRow({required this.stars});

  final int stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index >= stars) {
            return const Icon(
              Icons.star_border,
              color: Color(0xFFFFD979),
            );
          }
          return const Icon(
            Icons.star,
            color: Color(0xFFFFD979),
          );
        },
      ),
    );
  }
}
