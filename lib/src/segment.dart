import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

part 'partial_circle_painter.dart';
part 'story_segment_wrapper.dart';

/// A widget that displays a circular segmented border around an image,
/// commonly used for story indicators.
class StorySegmentView extends StatelessWidget {
  /// Creates a [StorySegmentView] widget.
  ///
  /// [imageUrl] is the URL of the image to be displayed at the center.
  /// [segments] defines the number of segments in the circular border.
  /// [radius] sets the size of the outer circle.
  /// [strokeWidth] determines the thickness of the segment lines.
  /// [color] specifies the color of the segments.
  /// Optional parameters:
  /// - [segmentGap] controls the gap between segments (default: 2.0).
  /// - [placeholder] is a widget displayed while the image loads.
  /// - [errorWidget] is a widget displayed if the image fails to load.
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
  });

  /// The URL of the avatar image.
  final String imageUrl;

  /// The number of segments in the circular indicator.
  final int segments;

  /// The radius of the outer segment circle.
  final double radius;

  /// The thickness of each segment line.
  final double strokeWidth;

  /// The gap between each segment.
  final double segmentGap;

  /// The color of the segment lines.
  final Color color;

  /// Widget displayed while the image is loading.
  final Widget Function(BuildContext, String)? placeholder;

  /// Widget displayed if the image fails to load.
  final Widget Function(BuildContext, String, Object)? errorWidget;

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
        ),
        Container(
          width: (radius * 2) - 8,
          height: (radius * 2) - 8,
          decoration: BoxDecoration(
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
