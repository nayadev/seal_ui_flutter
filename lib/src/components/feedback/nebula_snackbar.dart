import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/abstractions/color_palette.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../../tokens/base/nebula_radius.dart';

/// The visual variant of a [NebulaSnackbar].
enum _NebulaSnackbarVariant { info, success, warning, error, custom }

/// Controls where the snackbar appears on screen.
enum NebulaSnackbarAlignment {
  /// The snackbar slides in from the top of the screen.
  top,

  /// The snackbar appears at the bottom of the screen.
  bottom,
}

/// A themed floating snackbar with semantic color variants.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaSnackbar.info] — informational message.
/// - [NebulaSnackbar.success] — success confirmation.
/// - [NebulaSnackbar.warning] — non-critical warning.
/// - [NebulaSnackbar.error] — error or failure.
/// - [NebulaSnackbar.custom] — fully customised accent color/gradient and icon.
///
/// Display a snackbar by calling [show] with a [BuildContext] that has a
/// [ScaffoldMessenger] ancestor. Any existing snackbar is dismissed first.
///
/// ```dart
/// NebulaSnackbar.success(message: 'Profile saved!').show(context);
///
/// NebulaSnackbar.error(
///   message: 'Upload failed.',
///   title: 'Error',
///   actionLabel: 'Retry',
///   onAction: _retryUpload,
/// ).show(context);
///
/// NebulaSnackbar.custom(
///   message: 'New achievement unlocked!',
///   icon: Icons.emoji_events_rounded,
///   gradient: LinearGradient(colors: [Color(0xFFFFBE6A), Color(0xFFFF6B8A)]),
/// ).show(context);
/// ```
class NebulaSnackbar {
  const NebulaSnackbar._({
    required this.message,
    required _NebulaSnackbarVariant variant,
    this.title,
    this.duration = _kDefaultDuration,
    this.alignment = NebulaSnackbarAlignment.top,
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
  const factory NebulaSnackbar.info({
    required String message,
    String? title,
    Duration duration,
    NebulaSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _InfoNebulaSnackbar;

  /// Creates a **success** snackbar.
  const factory NebulaSnackbar.success({
    required String message,
    String? title,
    Duration duration,
    NebulaSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _SuccessNebulaSnackbar;

  /// Creates a **warning** snackbar.
  const factory NebulaSnackbar.warning({
    required String message,
    String? title,
    Duration duration,
    NebulaSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _WarningNebulaSnackbar;

  /// Creates an **error** snackbar.
  const factory NebulaSnackbar.error({
    required String message,
    String? title,
    Duration duration,
    NebulaSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _ErrorNebulaSnackbar;

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
  /// NebulaSnackbar.custom(
  ///   message: 'Achievement unlocked!',
  ///   icon: Icons.emoji_events_rounded,
  ///   color: Color(0xFF9B6DFF),
  /// ).show(context);
  ///
  /// // Gradient
  /// NebulaSnackbar.custom(
  ///   message: 'Achievement unlocked!',
  ///   icon: Icons.emoji_events_rounded,
  ///   gradient: LinearGradient(
  ///     colors: [Color(0xFFFFBE6A), Color(0xFFFF6B8A)],
  ///   ),
  /// ).show(context);
  /// ```
  const factory NebulaSnackbar.custom({
    required String message,
    required IconData icon,
    Color? color,
    Gradient? gradient,
    String? title,
    Duration duration,
    NebulaSnackbarAlignment alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _CustomNebulaSnackbar;

  /// The primary message displayed in the snackbar.
  final String message;

  /// Optional bold title shown above the [message].
  final String? title;

  /// How long the snackbar remains visible. Defaults to 4 seconds.
  final Duration duration;

  /// Where on screen the snackbar appears. Defaults to [NebulaSnackbarAlignment.top].
  final NebulaSnackbarAlignment alignment;

  /// Label for the optional action button.
  ///
  /// Requires [onAction] to be non-null for the button to appear.
  final String? actionLabel;

  /// Callback invoked when the action button is tapped.
  ///
  /// Requires [actionLabel] to be non-null for the button to appear.
  final VoidCallback? onAction;

  // ── Custom variant fields ────────────────────────────────────────────────

  /// Solid accent color used by [NebulaSnackbar.custom].
  ///
  /// Takes precedence over [customGradient] for the action button foreground.
  final Color? customColor;

  /// Gradient paint used by [NebulaSnackbar.custom] for the accent strip and
  /// leading icon. When set, [customColor] is still used for the action button
  /// (or the first stop is extracted as a fallback if [customColor] is null).
  final Gradient? customGradient;

  /// Icon used by [NebulaSnackbar.custom].
  final IconData? customIcon;

  final _NebulaSnackbarVariant _variant;

  /// Displays this snackbar in the widget tree.
  ///
  /// - [NebulaSnackbarAlignment.top]: slides in from the top via an [Overlay].
  ///   Any currently visible top snackbar is replaced immediately.
  /// - [NebulaSnackbarAlignment.bottom]: shows via [ScaffoldMessenger],
  ///   replacing any existing bottom snackbar first.
  void show(BuildContext context) {
    switch (alignment) {
      case NebulaSnackbarAlignment.bottom:
        _showAtBottom(context);
      case NebulaSnackbarAlignment.top:
        _showAtTop(context);
    }
  }

  void _showAtBottom(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: _NebulaSnackbarContent(snackbar: this),
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
      builder: (_) => NebulaTheme(
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

/// Redirecting factory for [NebulaSnackbar.info].
class _InfoNebulaSnackbar extends NebulaSnackbar {
  const _InfoNebulaSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _NebulaSnackbarVariant.info);
}

/// Redirecting factory for [NebulaSnackbar.success].
class _SuccessNebulaSnackbar extends NebulaSnackbar {
  const _SuccessNebulaSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _NebulaSnackbarVariant.success);
}

/// Redirecting factory for [NebulaSnackbar.warning].
class _WarningNebulaSnackbar extends NebulaSnackbar {
  const _WarningNebulaSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _NebulaSnackbarVariant.warning);
}

/// Redirecting factory for [NebulaSnackbar.error].
class _ErrorNebulaSnackbar extends NebulaSnackbar {
  const _ErrorNebulaSnackbar({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: _NebulaSnackbarVariant.error);
}

/// Redirecting factory for [NebulaSnackbar.custom].
class _CustomNebulaSnackbar extends NebulaSnackbar {
  const _CustomNebulaSnackbar({
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
         variant: _NebulaSnackbarVariant.custom,
         customIcon: icon,
         customColor: color,
         customGradient: gradient,
       );
}

/// Internal widget that renders a top-aligned [NebulaSnackbar] via [Overlay].
///
/// Slides in from the top and auto-dismisses after [NebulaSnackbar.duration].
class _TopSnackbarOverlay extends StatefulWidget {
  const _TopSnackbarOverlay({required this.snackbar, required this.onDismiss});

  final NebulaSnackbar snackbar;

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
                child: _NebulaSnackbarContent(snackbar: widget.snackbar),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Internal widget that renders the visual content of a [NebulaSnackbar].
class _NebulaSnackbarContent extends StatelessWidget {
  const _NebulaSnackbarContent({required this.snackbar});

  /// Width of the left semantic accent strip.
  static const double _kAccentStripWidth = 4.0;

  /// Diameter of the leading semantic icon.
  static const double _kIconSize = 20.0;

  final NebulaSnackbar snackbar;

  IconData _resolveIcon(ColorPalette colors) => switch (snackbar._variant) {
    _NebulaSnackbarVariant.info => Icons.info_rounded,
    _NebulaSnackbarVariant.success => Icons.check_circle_rounded,
    _NebulaSnackbarVariant.warning => Icons.warning_rounded,
    _NebulaSnackbarVariant.error => Icons.error_rounded,
    _NebulaSnackbarVariant.custom => snackbar.customIcon!,
  };

  Color _resolveAccentColor(ColorPalette colors) {
    if (snackbar._variant == _NebulaSnackbarVariant.custom) {
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
      _NebulaSnackbarVariant.info => colors.info,
      _NebulaSnackbarVariant.success => colors.success,
      _NebulaSnackbarVariant.warning => colors.warning,
      _NebulaSnackbarVariant.error => colors.error,
      _NebulaSnackbarVariant.custom => colors.primary,
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
    final accentGradient = snackbar._variant == _NebulaSnackbarVariant.custom
        ? snackbar.customGradient
        : null;
    final icon = _resolveIcon(colors);
    final hasTitle = snackbar.title != null;
    final hasAction = snackbar.actionLabel != null && snackbar.onAction != null;

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceAlt,
        borderRadius: NebulaRadius.borderRadiusSm,
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
