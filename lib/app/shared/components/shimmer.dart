import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/app/shared/extensions/context.dart';

/// A widget that shows a shimmer effect.
class ShimmerWidget extends StatelessWidget {
  /// The width of the shimmer effect. If null, it will take the full width. Expands to infinity if not specified.
  final double? width;

  /// The height of the shimmer effect. If null, it will take the full height. Expands to infinity if not specified.
  final double? height;
  const ShimmerWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ColoredBox(color: context.colorScheme.background),
      ),
    );
  }
}
