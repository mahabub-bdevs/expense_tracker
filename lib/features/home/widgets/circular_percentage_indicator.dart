import 'package:flutter/material.dart';
import '../../../core/core.dart';
import 'circle_painter.dart';

class CircularPercentageIndicator extends StatefulWidget {
  final double percentage;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final TextStyle? textStyle;
  final String suffix;
  final double? fontSize;
  final Color? fontColor;

  const CircularPercentageIndicator({
    super.key,
    required this.percentage,
    this.size = 80,
    this.progressColor = Colors.white,
    this.backgroundColor = const Color(0xFF7C3AED),
    this.strokeWidth = 5,
    this.textStyle,
    this.suffix = '%',
    this.fontSize = 10.0,
    this.fontColor = Colors.white,
  }) : assert(
         percentage >= 0 && percentage <= 100,
         'Percentage must be between 0 and 100',
       );

  @override
  State<CircularPercentageIndicator> createState() =>
      _CircularPercentageIndicatorState();
}

class _CircularPercentageIndicatorState
    extends State<CircularPercentageIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.percentage).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(CircularPercentageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _animation =
          Tween<double>(
            begin: _animation.value,
            end: widget.percentage,
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
          );
      _controller.forward(from: 0);
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
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: CirclePainter(
                  percentage: _animation.value,
                  progressColor: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                  strokeWidth: widget.strokeWidth,
                ),
              ),
              CustomText(
                text: '${_animation.value.toStringAsFixed(0)}${widget.suffix}',
                fontSize: widget.fontSize,
                color: widget.fontColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
