import 'dart:math' as math;

import 'package:flutter/material.dart';

/// An animated loading indicator with three dots bouncing in sequence.
///
/// Used internally by Seal button components during loading states.
///
/// ```dart
/// SealBouncingDots(color: Colors.white, size: 8)
/// ```
class SealBouncingDots extends StatefulWidget {
  /// Default diameter of each dot.
  static const double kDefaultDotSize = 6.0;

  /// Default horizontal spacing between dots.
  static const double kDefaultDotSpacing = 4.0;

  /// Duration (in milliseconds) of one full animation cycle.
  static const int kAnimationDurationMs = 1200;

  /// Delay multiplier between successive dot animations.
  static const double kDelayMultiplier = 0.15;

  /// Fraction of the cycle during which a dot actively bounces.
  static const double kActiveCycleFraction = 0.4;

  const SealBouncingDots({
    super.key,
    required this.color,
    this.size = kDefaultDotSize,
    this.spacing = kDefaultDotSpacing,
    this.height,
  });

  /// Color of the dots.
  final Color color;

  /// Diameter of each dot.
  final double size;

  /// Horizontal spacing between dots.
  final double spacing;

  /// Fixed height for the widget. When set, the dots are vertically centered
  /// and the bounce animation stays within this box — keeping the button
  /// the same size as its text state.
  final double? height;

  @override
  State<SealBouncingDots> createState() => _SealBouncingDotsState();
}

class _SealBouncingDotsState extends State<SealBouncingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: SealBouncingDots.kAnimationDurationMs,
      ),
    )..repeat();
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
      builder: (context, _) {
        final dots = Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final delay = index * SealBouncingDots.kDelayMultiplier;
            final raw = (_controller.value - delay) % 1.0;
            final activeFraction = SealBouncingDots.kActiveCycleFraction;
            final active = raw < activeFraction;
            final bounce = active
                ? math.sin((raw / activeFraction) * math.pi) * widget.size
                : 0.0;

            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : widget.spacing),
              child: Transform.translate(
                offset: Offset(0, -bounce),
                child: _Dot(size: widget.size, color: widget.color),
              ),
            );
          }),
        );

        if (widget.height != null) {
          return SizedBox(
            height: widget.height,
            child: Align(widthFactor: 1.0, child: dots),
          );
        }
        return dots;
      },
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
