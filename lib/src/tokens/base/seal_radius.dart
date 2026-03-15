import 'package:flutter/painting.dart';

/// Seal UI border-radius scale.
///
/// Consistent radii for rounded corners across the design system.
abstract final class SealRadius {
  /// No rounding.
  static const Radius none = Radius.zero;

  /// 4 px — subtle rounding.
  static const Radius xs = Radius.circular(4);

  /// 8 px — default rounding.
  static const Radius sm = Radius.circular(8);

  /// 12 px — medium rounding.
  static const Radius md = Radius.circular(12);

  /// 16 px — large rounding (cards, dialogs).
  static const Radius lg = Radius.circular(16);

  /// 24 px — extra-large rounding.
  static const Radius xl = Radius.circular(24);

  /// Fully circular (pill shape).
  static const Radius full = Radius.circular(999);

  // ── BorderRadius helpers ─────────────────────────────────────────────

  /// [BorderRadius] variant of [xs].
  static const BorderRadius borderRadiusXs = BorderRadius.all(xs);

  /// [BorderRadius] variant of [sm].
  static const BorderRadius borderRadiusSm = BorderRadius.all(sm);

  /// [BorderRadius] variant of [md].
  static const BorderRadius borderRadiusMd = BorderRadius.all(md);

  /// [BorderRadius] variant of [lg].
  static const BorderRadius borderRadiusLg = BorderRadius.all(lg);

  /// [BorderRadius] variant of [xl].
  static const BorderRadius borderRadiusXl = BorderRadius.all(xl);

  /// [BorderRadius] pill shape.
  static const BorderRadius borderRadiusFull = BorderRadius.all(full);
}
