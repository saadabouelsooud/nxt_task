part of '../reservation_page.dart';

class _LocationWidget extends StatelessWidget {
  const _LocationWidget({required this.stay});

  final Stay stay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14),
      color: context.colorScheme.outline.withOpacity(.35),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                stay.name,
                style: context.textTheme.titleSmall,
              ),
              subtitle: Text(stay.address),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/map.jpg'),
                Icon(Icons.location_on, color: context.colorScheme.outline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
