import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/app/shared/components/dashed_divider.dart';
import 'package:task/app/shared/extensions/context.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    super.key,
    required this.topChild,
    required this.bottomChild,
    required this.height,
    required this.width,
    this.radius = 50,
  });

  final Widget topChild;
  final Widget bottomChild;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + radius,
      width: width,
      child: Stack(
        children: [
          Positioned(
            height: height / 2 + radius / 2,
            width: context.width,
            child: topChild,
          ),
          Positioned(
            height: height / 2 + radius / 2,
            width: context.width,
            top: height / 2 + radius / 2,
            child: bottomChild,
          ),
          Positioned(
            top: height / 2,
            right: -radius / 2,
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: height / 2 + radius / 2,
            right: radius / 2,
            left: radius / 2,
            child: const DashedDivider(),
          ),
          Positioned(
            top: height / 2,
            left: -radius / 2,
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
