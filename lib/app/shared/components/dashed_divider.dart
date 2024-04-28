import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task/app/shared/extensions/context.dart';

class DashedDivider extends StatelessWidget {
  final Color? color;
  const DashedDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      strokeWidth: 1,
      color: color ?? context.colorScheme.onBackground,
      dashPattern: const [5, 5],
      child: const SizedBox(),
    );
  }
}
