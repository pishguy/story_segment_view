part of 'segment.dart';

class _StorySegmentWrapper extends StatelessWidget {
  const _StorySegmentWrapper({
    required this.segments,
    required this.radius,
    required this.strokeWidth,
    required this.color,
    this.gap = 2.0,
  });

  final int segments;
  final double radius;
  final double strokeWidth;
  final double gap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _PartialCirclePainter(
        color: color,
        segments: segments,
        radius: radius,
        strokeWidth: strokeWidth,
        gap: gap,
      ),
    );
  }
}