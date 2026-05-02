import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../tokens/abstractions/color_palette.dart';

/// Internal semantic variant shared by [SealAlert] and [SealToast].
///
/// Not part of the public API — not exported from the barrel.
enum SealSemanticVariant {
  /// Informational message.
  info,

  /// Success confirmation.
  success,

  /// Non-critical warning.
  warning,

  /// Error or failure.
  error,
}

/// Internal helpers for [SealSemanticVariant].
extension SealSemanticVariantX on SealSemanticVariant {
  /// Returns the icon that represents this semantic state.
  IconData get icon => switch (this) {
    SealSemanticVariant.info => LucideIcons.info,
    SealSemanticVariant.success => LucideIcons.circleCheck,
    SealSemanticVariant.warning => LucideIcons.triangleAlert,
    SealSemanticVariant.error => LucideIcons.circleX,
  };

  /// Returns the accent color for this semantic state from [colors].
  Color accentColor(ColorPalette colors) => switch (this) {
    SealSemanticVariant.info => colors.info,
    SealSemanticVariant.success => colors.success,
    SealSemanticVariant.warning => colors.warning,
    SealSemanticVariant.error => colors.error,
  };
}
