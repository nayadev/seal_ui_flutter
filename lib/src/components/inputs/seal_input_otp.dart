import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

// Default slot dimension matching shadcn_ui's default (40 × 40).
const double _kSlotSize = 40.0;

/// A token-driven one-time password input built on [ShadInputOTP].
///
/// Compose with [SealInputOTPGroup] and [SealInputOTPSlot] to build
/// the desired layout. Use [maxLength] to declare the total number of
/// characters across all groups.
///
/// ```dart
/// SealInputOTP(
///   maxLength: 6,
///   onChanged: (value) => debugPrint(value),
///   children: [
///     SealInputOTPGroup(
///       children: List.generate(3, (_) => const SealInputOTPSlot()),
///     ),
///     SealInputOTPGroup(
///       children: List.generate(3, (_) => const SealInputOTPSlot()),
///     ),
///   ],
/// )
/// ```
class SealInputOTP extends StatelessWidget {
  /// Creates a [SealInputOTP].
  const SealInputOTP({
    super.key,
    required this.maxLength,
    required this.children,
    this.enabled = true,
    this.onChanged,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.jumpToNextWhenFilled = true,
  });

  /// Total number of OTP characters across all groups.
  final int maxLength;

  /// The slot groups. Typically one or two [SealInputOTPGroup] widgets.
  final List<Widget> children;

  /// Whether the input accepts interaction. Defaults to `true`.
  final bool enabled;

  /// Called with the full OTP string whenever any slot changes.
  final ValueChanged<String>? onChanged;

  /// Pre-filled OTP value. Use a space `' '` to skip a position.
  final String? initialValue;

  /// Keyboard type applied to all slots unless overridden per-slot.
  ///
  /// Defaults to [TextInputType.number] for numeric OTPs.
  final TextInputType? keyboardType;

  /// Input formatters applied to all slots unless overridden per-slot.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether focus advances to the next slot when the current one is filled.
  /// Defaults to `true`.
  final bool jumpToNextWhenFilled;

  @override
  Widget build(BuildContext context) {
    final dimension = context.dimension;

    return ShadInputOTP(
      maxLength: maxLength,
      gap: dimension.xs,
      enabled: enabled,
      onChanged: onChanged,
      initialValue: initialValue,
      keyboardType: keyboardType ?? TextInputType.number,
      inputFormatters: inputFormatters,
      jumpToNextWhenFilled: jumpToNextWhenFilled,
      children: children,
    );
  }
}

/// A group of [SealInputOTPSlot]s within a [SealInputOTP].
///
/// Slots within the same group share border-radius styling to form a
/// connected block.
///
/// ```dart
/// SealInputOTPGroup(
///   children: List.generate(3, (_) => const SealInputOTPSlot()),
/// )
/// ```
class SealInputOTPGroup extends StatelessWidget {
  /// Creates a [SealInputOTPGroup].
  const SealInputOTPGroup({super.key, required this.children});

  /// The individual [SealInputOTPSlot] widgets.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ShadInputOTPGroup(children: children);
  }
}

/// A single character slot inside a [SealInputOTPGroup].
///
/// Sizes responsively to the breakpoint via [SealDimension.scaled].
///
/// ```dart
/// const SealInputOTPSlot()
/// ```
class SealInputOTPSlot extends StatelessWidget {
  /// Creates a [SealInputOTPSlot].
  const SealInputOTPSlot({
    super.key,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.initialValue,
    this.textInputAction,
  });

  /// Override focus node for this slot.
  final FocusNode? focusNode;

  /// Override input formatters for this slot.
  final List<TextInputFormatter>? inputFormatters;

  /// Override keyboard type for this slot.
  final TextInputType? keyboardType;

  /// Pre-filled value for this slot.
  final String? initialValue;

  /// Text input action for this slot.
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;
    final slotSize = dimension.scaled(_kSlotSize);

    return ShadInputOTPSlot(
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      initialValue: initialValue,
      textInputAction: textInputAction,
      width: slotSize,
      height: slotSize,
      style: typo.small.copyWith(color: colors.textPrimary),
      singleRadius: SealRadius.borderRadiusMd,
      firstRadius: BorderRadius.only(
        topLeft: SealRadius.borderRadiusMd.topLeft,
        bottomLeft: SealRadius.borderRadiusMd.bottomLeft,
      ),
      lastRadius: BorderRadius.only(
        topRight: SealRadius.borderRadiusMd.topRight,
        bottomRight: SealRadius.borderRadiusMd.bottomRight,
      ),
      middleRadius: BorderRadius.zero,
    );
  }
}
