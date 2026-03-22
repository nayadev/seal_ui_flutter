import 'package:flutter/widgets.dart';

/// A widget that wraps [child] with a subtle press-feedback animation.
///
/// On tap-down, the child scales down slightly and fades; on tap-up or cancel
/// it springs back. Useful for any tappable surface that wants a consistent
/// press response without Material ripple effects.
///
/// ```dart
/// SealPressable(
///   onTap: () => doSomething(),
///   child: MyCard(),
/// )
/// ```
///
/// The [pressedScale] and [pressedOpacity] values can be overridden when the
/// default subtle effect is not appropriate for a given context.
class SealPressable extends StatefulWidget {
  /// Creates a [SealPressable].
  const SealPressable({
    super.key,
    required this.onTap,
    required this.child,
    this.pressedScale = kDefaultPressedScale,
    this.pressedOpacity = kDefaultPressedOpacity,
    this.duration = kDefaultDuration,
    this.curve = Curves.easeInOut,
  });

  /// Callback invoked when the user taps.
  ///
  /// When `null` the press animation is still applied but no action fires.
  final VoidCallback? onTap;

  /// The widget below this one in the tree.
  final Widget child;

  /// Scale applied while the user is pressing. Defaults to `0.98`.
  final double pressedScale;

  /// Opacity applied while the user is pressing. Defaults to `0.85`.
  final double pressedOpacity;

  /// Duration of the in/out animation. Defaults to 100 ms.
  final Duration duration;

  /// Animation curve. Defaults to [Curves.easeInOut].
  final Curve curve;

  /// Default value for [pressedScale].
  static const double kDefaultPressedScale = 0.98;

  /// Default value for [pressedOpacity].
  static const double kDefaultPressedOpacity = 0.85;

  /// Default value for [duration].
  static const Duration kDefaultDuration = Duration(milliseconds: 100);

  @override
  State<SealPressable> createState() => _SealPressableState();
}

class _SealPressableState extends State<SealPressable> {
  bool _pressed = false;

  void _onTapDown(TapDownDetails _) => setState(() => _pressed = true);
  void _onTapUp(TapUpDetails _) => setState(() => _pressed = false);
  void _onTapCancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedScale(
          scale: _pressed ? widget.pressedScale : 1.0,
          duration: widget.duration,
          curve: widget.curve,
          child: AnimatedOpacity(
            opacity: _pressed ? widget.pressedOpacity : 1.0,
            duration: widget.duration,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
