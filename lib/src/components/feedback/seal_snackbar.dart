import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/abstractions/color_palette.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// The visual variant of a [SealSnackbar].
enum _SealSnackbarVariant { info, success, warning, error, custom }

/// Controls where the snackbar appears on screen.
enum SealSnackbarAlignment {
  /// The snackbar slides in from the top of the screen.
  top,

  /// The snackbar appears at the bottom of the screen.
  bottom,
}

/// A themed floating snackbar with semantic color variants.
///
/// Use the named constructors to choose a variant:
///
/// - [SealSnackbar.info] — informational message.
/// - [SealSnackbar.success] — success confirmation.
/// - [SealSnackbar.warning] — non-critical warning.
/// - [SealSnackbar.error] — error or failure.
/// - [SealSnackbar.custom] — fully customised accent color/gradient and icon.
///
/// Display a snackbar by calling [show] with a [BuildContext] that has a
/// [ScaffoldMessenger] ancestor. Any existing snackbar is dismissed first.
///
/// ```dart
/// SealSnackbar.success(message: 'Profile saved!').show(context);
///
/// SealSnackbar.error(
///   message: 'Upload failed.',
///   title: 'Error',
///   actionLabel: 'Retry',
///   onAction: _retryUpload,
/// ).show(context);
///
/// SealSnackbar.custom(
///   message: 'New achievement unlocked!',
///   icon: Icons.emoji_events_rounded,
///   gradient: LinearGradient(colors: [Color(0xFFFFBE6A), Color(0xFFFF6B8A)]),
/// ).show(context);
/// ```
class SealSnackbar {
  const SealSnackbar._({
    required this.message,
    required _SealSnackbarVariant variant,
    this.title,
    this.duration = _kDefaultDuration,
    this.alignment = SealSnackbarAlignment.top,
    this.actionLabel,
    this.onAction,
    this.customColor,
    this.customGradient,
    this.customIcon,
  }) : _variant = variant;

  /// Default display duration when none is specified.
  static const Duration _kDefaultDuration = Duration(seconds: 4);

  // Holds the active top-aligned overlay entry so it can be replaced.
  static OverlayEntry? _currentTopEntry;

  /// Creates an **informational** snackbar.
  const factory SealSnackbar.info({
    required String message,
    String? title,
    Duration duration,
    SealSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _InfoSealSnackbar;

  /// Creates a **success** snackbar.
  const factory SealSnackbar.success({
    required String message,
    String? title,
    Duration duration,
    SealSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _SuccessSealSnackbar;

  /// Creates a **warning** snackbar.
  const factory SealSnackbar.warning({
    required String message,
    String? title,
    Duration duration,
    SealSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _WarningSealSnackbar;

  /// Creates an **error** snackbar.
  const factory SealSnackbar.error({
    required String message,
    String? title,
    Duration duration,
    SealSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _ErrorSealSnackbar;

  /// Creates a fully **custom** snackbar.
  ///
  /// The accent strip and leading [icon] are painted with [gradient] when
  /// provided, otherwise with [color]. Exactly one of [color] or [gradient]
  /// must be supplied — passing both or neither will throw an assertion error.
  ///
  /// When [gradient] is used, the action button foreground color is
  /// automatically derived from the first gradient stop.
  ///
  /// ```dart
  /// // Solid color
  /// SealSnackbar.custom(
  ///   message: 'Achievement unlocked!',
  ///   icon: Icons.emoji_events_rounded,
  ///   color: Color(0xFF9B6DFF),
  /// ).show(context);
  ///
  /// // Gradient
  /// SealSnackbar.custom(
  ///   message: 'Achievement unlocked!',
  ///   icon: Icons.emoji_events_rounded,
  ///   gradient: LinearGradient(
  ///     colors: [Color(0xFFFFBE6A), Color(0xFFFF6B8A)],
  ///   ),
  /// ).show(context);
  /// ```
  const factory SealSnackbar.custom({
    required String message,
    required IconData icon,
    Color? color,
    Gradient? gradient,
    String? title,
    Duration duration,
    SealSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _CustomSealSnackbar;

  /// The primary message displayed in the snackbar.
  final String message;

  /// Optional bold title shown above the [message].
  final String? title;

  /// How long the snackbar remains visible. Defaults to 4 seconds.
  final Duration duration;

  /// Where on screen the snackbar appears. Defaults to [SealSnackbarAlignment.top].
  final SealSnackbarAlignment alignment;

  /// Label for the optional action button.
  ///
  /// Requires [onAction] to be non-null for the button to appear.
  final String? actionLabel;

  /// Callback invoked when the action button is tapped.
  ///
  /// Requires [actionLabel] to be non-null for the button to appear.
  final VoidCallback? onAction;

  // ── Custom variant fields ────────────────────────────────────────────────

  /// Solid accent color used by [SealSnackbar.custom].
  ///
  /// Takes precedence over [customGradient] for the action button foreground.
  final Color? customColor;

  /// Gradient paint used by [SealSnackbar.custom] for the accent strip and
  /// leading icon. When set, [customColor] is still used for the action button
  /// (or the first stop is extracted as a fallback if [customColor] is null).
  final Gradient? customGradient;

  /// Icon used by [SealSnackbar.custom].
  final IconData? customIcon;

  final _SealSnackbarVariant _variant;

  /// Displays this snackbar in the widget tree.
  ///
  /// - [SealSnackbarAlignment.top]: slides in from the top via an [Overlay].
  ///   Any currently visible top snackbar is replaced immediately.
  /// - [SealSnackbarAlignment.bottom]: shows via [ScaffoldMessenger],
  ///   replacing any existing bottom snackbar first.
  void show(BuildContext context) {
    switch (alignment) {
      case SealSnackbarAlignment.bottom:
        _showAtBottom(context);
      case SealSnackbarAlignment.top:
        _showAtTop(context);
    }
  }

  void _showAtBottom(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: _SealSnackbarContent(snackbar: this),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(context.dimension.md),
          padding: EdgeInsets.zero,
          duration: duration,
        ),
      );
  }

  void _showAtTop(BuildContext context) {
    _currentTopEntry?.remove();
    _currentTopEntry = null;

    final overlay = Overlay.of(context);
    final tokens = context.themeTokens;

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => SealTheme(
        tokens: tokens,
        child: _TopSnackbarOverlay(
          snackbar: this,
          onDismiss: () {
            if (_currentTopEntry == entry) _currentTopEntry = null;
            entry.remove();
          },
        ),
      ),
    );
    _currentTopEntry = entry;
    overlay.insert(entry);
  }
}

/// Redirecting factory for [SealSnackbar.info].
class _InfoSealSnackbar extends SealSnackbar {
  const _InfoSealSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _SealSnackbarVariant.info);
}

/// Redirecting factory for [SealSnackbar.success].
class _SuccessSealSnackbar extends SealSnackbar {
  const _SuccessSealSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _SealSnackbarVariant.success);
}

/// Redirecting factory for [SealSnackbar.warning].
class _WarningSealSnackbar extends SealSnackbar {
  const _WarningSealSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _SealSnackbarVariant.warning);
}

/// Redirecting factory for [SealSnackbar.error].
class _ErrorSealSnackbar extends SealSnackbar {
  const _ErrorSealSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _SealSnackbarVariant.error);
}

/// Redirecting factory for [SealSnackbar.custom].
class _CustomSealSnackbar extends SealSnackbar {
  const _CustomSealSnackbar({
    required super.message,
    required IconData icon,
    Color? color,
    Gradient? gradient,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : assert(
         (color == null) != (gradient == null),
         'Provide either color or gradient — not both and not neither.',
       ),
       super._(
         variant: _SealSnackbarVariant.custom,
         customIcon: icon,
         customColor: color,
         customGradient: gradient,
       );
}

/// Internal widget that renders a top-aligned [SealSnackbar] via [Overlay].
///
/// Slides in from the top and auto-dismisses after [SealSnackbar.duration].
class _TopSnackbarOverlay extends StatefulWidget {
  const _TopSnackbarOverlay({required this.snackbar, required this.onDismiss});

  final SealSnackbar snackbar;

  /// Called when the exit animation finishes and the entry should be removed.
  final VoidCallback onDismiss;

  @override
  State<_TopSnackbarOverlay> createState() => _TopSnackbarOverlayState();
}

class _TopSnackbarOverlayState extends State<_TopSnackbarOverlay>
    with SingleTickerProviderStateMixin {
  static const Duration _kEnterDuration = Duration(milliseconds: 300);
  static const Duration _kExitDuration = Duration(milliseconds: 250);

  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _kEnterDuration);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    _dismissTimer = Timer(widget.snackbar.duration, () {
      if (mounted) _dismiss();
    });
  }

  Future<void> _dismiss() async {
    if (!mounted) return;
    _controller.duration = _kExitDuration;
    await _controller.reverse();
    if (mounted) widget.onDismiss();
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = context.dimension;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        // ClipRect confines the slide animation to the area below the status
        // bar, so the snackbar disappears at the safe-area edge instead of
        // sliding visibly through the system UI.
        child: ClipRect(
          child: SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: EdgeInsets.all(dimension.md),
              child: Material(
                color: Colors.transparent,
                child: _SealSnackbarContent(snackbar: widget.snackbar),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Internal widget that renders the visual content of a [SealSnackbar].
class _SealSnackbarContent extends StatelessWidget {
  const _SealSnackbarContent({required this.snackbar});

  /// Width of the left semantic accent strip.
  static const double _kAccentStripWidth = 4.0;

  /// Diameter of the leading semantic icon.
  static const double _kIconSize = 20.0;

  final SealSnackbar snackbar;

  IconData _resolveIcon(ColorPalette colors) => switch (snackbar._variant) {
    _SealSnackbarVariant.info => Icons.info_rounded,
    _SealSnackbarVariant.success => Icons.check_circle_rounded,
    _SealSnackbarVariant.warning => Icons.warning_rounded,
    _SealSnackbarVariant.error => Icons.error_rounded,
    _SealSnackbarVariant.custom => snackbar.customIcon!,
  };

  Color _resolveAccentColor(ColorPalette colors) {
    if (snackbar._variant == _SealSnackbarVariant.custom) {
      if (snackbar.customColor != null) return snackbar.customColor!;
      // Extract a representative color from the gradient for the action button.
      return switch (snackbar.customGradient) {
        LinearGradient(colors: final c) when c.isNotEmpty => c.first,
        RadialGradient(colors: final c) when c.isNotEmpty => c.first,
        SweepGradient(colors: final c) when c.isNotEmpty => c.first,
        _ => colors.primary,
      };
    }
    return switch (snackbar._variant) {
      _SealSnackbarVariant.info => colors.info,
      _SealSnackbarVariant.success => colors.success,
      _SealSnackbarVariant.warning => colors.warning,
      _SealSnackbarVariant.error => colors.error,
      _SealSnackbarVariant.custom => colors.primary,
    };
  }

  /// Wraps [child] with a [ShaderMask] that applies [gradient], or returns
  /// [child] unchanged when [gradient] is null.
  Widget _applyGradient({required Widget child, required Gradient? gradient}) {
    if (gradient == null) return child;
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;
    final accentColor = _resolveAccentColor(colors);
    final accentGradient = snackbar._variant == _SealSnackbarVariant.custom
        ? snackbar.customGradient
        : null;
    final icon = _resolveIcon(colors);
    final hasTitle = snackbar.title != null;
    final hasAction = snackbar.actionLabel != null && snackbar.onAction != null;

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceAlt,
        borderRadius: SealRadius.borderRadiusSm,
        border: Border.all(color: colors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _applyGradient(
              gradient: accentGradient,
              child: Container(
                width: dimension.scaled(_kAccentStripWidth),
                color: accentGradient != null ? Colors.white : accentColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimension.sm,
                  vertical: dimension.sm,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _applyGradient(
                      gradient: accentGradient,
                      child: Icon(
                        icon,
                        color: accentGradient != null
                            ? Colors.white
                            : accentColor,
                        size: dimension.scaled(_kIconSize),
                      ),
                    ),
                    dimension.xs.horizontalGap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (hasTitle)
                            Text(
                              snackbar.title!,
                              style: typo.small.copyWith(
                                color: colors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          Text(
                            snackbar.message,
                            style: typo.small.copyWith(
                              color: hasTitle
                                  ? colors.textSecondary
                                  : colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (hasAction) ...[
                      dimension.xs.horizontalGap,
                      TextButton(
                        onPressed: snackbar.onAction,
                        style: TextButton.styleFrom(
                          foregroundColor: accentGradient != null
                              ? Colors.white
                              : accentColor,
                          textStyle: typo.small.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: dimension.xs,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: _applyGradient(
                          gradient: accentGradient,
                          child: Text(snackbar.actionLabel!),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
