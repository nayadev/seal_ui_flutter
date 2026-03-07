import 'package:flutter/widgets.dart';

import '../../nebula_ui.dart';

/// The current device category inferred from screen width.
enum DeviceType { mobile, tablet, desktop }

/// Responsive utilities for adapting UI to different screen sizes.
///
/// Use [NebulaResponsive.of] inside a build method to retrieve the current
/// [DeviceType], or use the convenience boolean getters.
///
/// Spacing and font sizes can be scaled proportionally with [scaleFactor],
/// [scaled], and [spacing]:
///
/// ```dart
/// final responsive = NebulaResponsive.of(context);
///
/// // Ad-hoc scaled value
/// padding: EdgeInsets.all(responsive.scaled(16)),
///
/// // Pre-scaled spacing set
/// final sp = responsive.spacing;
/// padding: EdgeInsets.symmetric(horizontal: sp.lg, vertical: sp.sm),
/// ```
class NebulaResponsive {
  const NebulaResponsive._(this.deviceType);

  /// Resolves the [DeviceType] for the given [context].
  factory NebulaResponsive.of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < NebulaBreakpoints.mobile) {
      return const NebulaResponsive._(DeviceType.mobile);
    }
    if (width < NebulaBreakpoints.tablet) {
      return const NebulaResponsive._(DeviceType.tablet);
    }
    return const NebulaResponsive._(DeviceType.desktop);
  }

  /// The resolved device type.
  final DeviceType deviceType;

  /// `true` when on a mobile-sized screen.
  bool get isMobile => deviceType == DeviceType.mobile;

  /// `true` when on a tablet-sized screen.
  bool get isTablet => deviceType == DeviceType.tablet;

  /// `true` when on a desktop-sized screen.
  bool get isDesktop => deviceType == DeviceType.desktop;

  /// A balanced multiplier that scales spacing and typography per breakpoint.
  ///
  /// | Device  | Factor |
  /// |---------|--------|
  /// | mobile  | 1.0    |
  /// | tablet  | 1.125  |
  /// | desktop | 1.5    |
  double get scaleFactor => switch (deviceType) {
    DeviceType.mobile => 1.0,
    DeviceType.tablet => 1.125,
    DeviceType.desktop => 1.5,
  };

  /// Convenience shortcut for `NebulaResponsive.of(context).scaleFactor`.
  static double scaleOf(BuildContext context) =>
      NebulaResponsive.of(context).scaleFactor;

  /// Applies [scaleFactor] to [base] and rounds to the nearest pixel.
  double scaled(double base) => (base * scaleFactor).roundToDouble();

  /// Returns a [NebulaDimension] with every value pre-scaled
  /// to the current breakpoint.
  NebulaDimension get spacing => NebulaDimension(scaleFactor);

  /// Returns one of the provided values depending on the current breakpoint.
  T value<T>({required T mobile, T? tablet, required T desktop}) {
    return switch (deviceType) {
      DeviceType.mobile => mobile,
      DeviceType.tablet => tablet ?? desktop,
      DeviceType.desktop => desktop,
    };
  }
}
