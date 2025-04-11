part of 'segment.dart';

class _PartialCirclePainter extends CustomPainter {
  _PartialCirclePainter({
    required this.segments,
    required this.radius,
    required this.strokeWidth,
    required this.gap,
    required this.color,
    this.rotationAngle = 0.0,
    required this.padding,
  });

  final int segments;
  final double radius;
  final double strokeWidth;
  final double gap;
  final Color color;
  final double rotationAngle;
  final double padding;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final adjustedRadius = radius + padding; // تنظیم radius با padding
    final totalGapAngle = segments > 1
        ? (gap * segments) * (2 * 3.14159265359) / (2 * adjustedRadius)
        : 0.0;
    final segmentAngle =
        (2 * 3.14159265359 - totalGapAngle) / segments;

    for (var i = 0; i < segments; i++) {
      final baseStartAngle =
          i * (segmentAngle + (gap * (2 * 3.14159265359) / (2 * adjustedRadius)));
      final startAngle = baseStartAngle + rotationAngle;

      canvas.drawArc(
        Offset(size.width / 2 - adjustedRadius, size.height / 2 - adjustedRadius) &
        Size(adjustedRadius * 2, adjustedRadius * 2),
        startAngle,
        segmentAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PartialCirclePainter oldDelegate) =>
      oldDelegate.rotationAngle != rotationAngle ||
          oldDelegate.segments != segments ||
          oldDelegate.radius != radius ||
          oldDelegate.strokeWidth != strokeWidth ||
          oldDelegate.gap != gap ||
          oldDelegate.color != color ||
          oldDelegate.padding != padding;
}
