part of 'segment.dart';

class _StorySegmentWrapper extends StatefulWidget {
  const _StorySegmentWrapper({
    required this.segments,
    required this.radius,
    required this.strokeWidth,
    required this.color,
    this.gap = 2.0,
    required this.isAnimated,
    required this.rotationDuration,
    required this.padding,
  });

  final int segments;
  final double radius;
  final double strokeWidth;
  final double gap;
  final Color color;
  final bool isAnimated;
  final Duration rotationDuration;
  final double padding;

  @override
  State<_StorySegmentWrapper> createState() => _StorySegmentWrapperState();
}

class _StorySegmentWrapperState extends State<_StorySegmentWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.rotationDuration,
    );
    if (widget.isAnimated) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(_StorySegmentWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimated != oldWidget.isAnimated) {
      if (widget.isAnimated) {
        _controller.repeat();
      } else {
        _controller.stop();
        _controller.value = 0;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.radius * 2, widget.radius * 2),
          painter: _PartialCirclePainter(
            color: widget.color,
            segments: widget.segments,
            radius: widget.radius,
            strokeWidth: widget.strokeWidth,
            gap: widget.gap,
            rotationAngle:
            widget.isAnimated ? _controller.value * 2 * 3.14159265359 : 0.0,
            padding: widget.padding,
          ),
        );
      },
    );
  }
}
