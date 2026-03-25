import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// The visual size of a [SealLoader].
enum SealLoaderSize {
  /// 16 × 16
  small(16),

  /// 24 × 24
  medium(24),

  /// 40 × 40
  large(40);

  const SealLoaderSize(this._dimension);

  /// The width and height of the indicator.
  final double _dimension;

  /// Resolves the actual dimension by applying the current [SealDimension] scale
  double dimension(BuildContext context) =>
      context.dimension.scaled(_dimension);
}

/// A loading indicator styled with Seal UI tokens.
///
/// Renders a spinning arc drawn entirely with [CustomPaint] — no Material
/// dependency required.
///
/// ```dart
/// const SealLoader()
/// const SealLoader(size: SealLoaderSize.large)
/// ```
class SealLoader extends StatelessWidget {
  /// Creates a [SealLoader] spinning indicator.
  const SealLoader({
    super.key,
    this.size = SealLoaderSize.medium,
    this.color,
    this.strokeWidth,
    this.label,
  });

  /// The size preset for the indicator.
  final SealLoaderSize size;

  /// Custom color — defaults to `colors.primary`.
  final Color? color;

  /// Stroke width used for the large size preset.
  static const double _kStrokeWidthLarge = 3.0;

  /// Stroke width used for small and medium size presets.
  static const double _kStrokeWidthDefault = 2.5;

  /// Custom stroke width — defaults to `2.5` for small/medium, `3.0` for
  /// large.
  final double? strokeWidth;

  /// Optional text label shown below the spinner.
  final String? label;

  double get _strokeWidth {
    if (strokeWidth != null) return strokeWidth!;
    return size == SealLoaderSize.large
        ? _kStrokeWidthLarge
        : _kStrokeWidthDefault;
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final effectiveColor = color ?? tokens.colors.primary;

    final indicator = _CircularLoader(
      size: size.dimension(context),
      strokeWidth: context.dimension.scaled(_strokeWidth),
      color: effectiveColor,
    );

    if (label == null) return indicator;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        indicator,
        context.dimension.sm.verticalGap,
        Text(
          label!,
          style: tokens.typography.caption.copyWith(
            color: tokens.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// Spinning arc indicator implemented with [CustomPaint].
class _CircularLoader extends StatefulWidget {
  const _CircularLoader({
    required this.size,
    required this.strokeWidth,
    required this.color,
  });

  final double size;
  final double strokeWidth;
  final Color color;

  @override
  State<_CircularLoader> createState() => _CircularLoaderState();
}

class _CircularLoaderState extends State<_CircularLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, _) => CustomPaint(
          painter: _ArcPainter(
            progress: _controller.value,
            strokeWidth: widget.strokeWidth,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  const _ArcPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
  });

  final double progress;
  final double strokeWidth;
  final Color color;

  /// Arc covers ¾ of the circle.
  static const double _kSweep = math.pi * 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final radius = size.width / 2 - strokeWidth / 2;
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      -math.pi / 2 + progress * math.pi * 2,
      _kSweep,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) =>
      old.progress != progress ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}
