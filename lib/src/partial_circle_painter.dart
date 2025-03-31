part of 'segment.dart';

class _PartialCirclePainter extends CustomPainter {
  _PartialCirclePainter({
    required this.segments,
    required this.radius,
    required this.strokeWidth,
    required this.gap,
    required this.color,
  });

  final int segments;
  final double radius;
  final double strokeWidth;
  final double gap;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final totalGapAngle = segments > 1 ? (gap * segments) * (2 * 3.14159265359) / (2 * radius) : 0.0;
    final segmentAngle = (2 * 3.14159265359 - totalGapAngle) / segments;

    for (var i = 0; i < segments; i++) {
      final startAngle = i * (segmentAngle + (gap * (2 * 3.14159265359) / (2 * radius)));

      canvas.drawArc(
        Offset(size.width / 2 - radius, size.height / 2 - radius) & Size(radius * 2, radius * 2),
        startAngle,
        segmentAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
