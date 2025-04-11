import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

part 'partial_circle_painter.dart';
part 'story_segment_wrapper.dart';

/// A widget that displays a circular segmented border around an image,
/// commonly used for story indicators.
class StorySegmentView extends StatelessWidget {
  const StorySegmentView({
    required this.imageUrl,
    required this.segments,
    required this.radius,
    required this.strokeWidth,
    required this.color,
    super.key,
    this.segmentGap = 2.0,
    this.errorWidget,
    this.placeholder,
    this.isAnimated = true,
    this.rotationDuration = const Duration(seconds: 5),
    this.padding = 4.0, // آرگومان جدید برای فاصله از مرکز
  });

  final String imageUrl;
  final int segments;
  final double radius;
  final double strokeWidth;
  final double segmentGap;
  final Color color;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final bool isAnimated;
  final Duration rotationDuration;
  final double padding; // فاصله سگمنت‌ها از دایره مرکزی

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _StorySegmentWrapper(
          segments: segments,
          color: color,
          radius: radius,
          strokeWidth: strokeWidth,
          gap: segmentGap,
          isAnimated: isAnimated,
          rotationDuration: rotationDuration,
          padding: padding,
        ),
        Container(
          width: (radius * 2) - 8,
          height: (radius * 2) - 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: placeholder,
              errorWidget: errorWidget,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
