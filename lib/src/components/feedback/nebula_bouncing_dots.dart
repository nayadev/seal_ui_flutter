import 'dart:math' as math;

import 'package:flutter/material.dart';

/// An animated loading indicator with three dots bouncing in sequence.
///
/// Used internally by Nebula button components during loading states.
///
/// ```dart
/// NebulaBouncingDots(color: Colors.white, size: 8)
/// ```
class NebulaBouncingDots extends StatefulWidget {
  const NebulaBouncingDots({
    super.key,
    required this.color,
    this.size = 6.0,
    this.spacing = 4.0,
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
  State<NebulaBouncingDots> createState() => _NebulaBouncingDotsState();
}

class _NebulaBouncingDotsState extends State<NebulaBouncingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
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
            final delay = index * 0.15;
            final raw = (_controller.value - delay) % 1.0;
            // Each dot uses a smooth sine wave over 40% of the cycle,
            // resting gently for the remaining 60%.
            final active = raw < 0.4;
            final bounce = active
                ? math.sin((raw / 0.4) * math.pi) * widget.size
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
