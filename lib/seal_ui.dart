/// # Seal UI
///
/// A token-driven Flutter Design System with space-inspired aesthetics.
///
/// Seal UI provides a layered architecture of design tokens, theming, and
/// ready-to-use components — featuring purple-based palettes, subtle gradients,
/// and responsive scaling out of the box.
///
/// ## Quick start
///
/// ```dart
/// import 'package:seal_ui/seal_ui.dart';
///
/// MaterialApp(
///   theme: SealThemeFactory.dark(),
///   builder: (context, child) => SealTheme(
///     tokens: SealThemeFactory.darkTokens(),
///     child: child!,
///   ),
///   home: const MyHomePage(),
/// );
/// ```
library;

// ── Foundation ─────────────────────────────────────────────────────────────
export 'src/foundation/seal_breakpoints.dart';
export 'src/foundation/seal_responsive.dart';
export 'src/foundation/seal_underline_extension.dart';

// ── Tokens · Abstractions ──────────────────────────────────────────────────
export 'src/tokens/abstractions/color_palette.dart';
export 'src/tokens/abstractions/gradient_tokens.dart';
export 'src/tokens/abstractions/typography_tokens.dart';

// ── Tokens · Base ──────────────────────────────────────────────────────────
export 'src/tokens/base/seal_radius.dart';
export 'src/tokens/base/seal_dimension.dart';
export 'src/tokens/base/seal_state_color.dart';

// ── Tokens · Implementations ───────────────────────────────────────────────
export 'src/tokens/implementations/dark_color_palette.dart';
export 'src/tokens/implementations/dark_gradients.dart';
export 'src/tokens/implementations/default_typography.dart';
export 'src/tokens/implementations/light_color_palette.dart';
export 'src/tokens/implementations/light_gradients.dart';

// ── Theme ──────────────────────────────────────────────────────────────────
export 'src/theme/seal_theme.dart';
export 'src/theme/seal_theme_factory.dart';
export 'src/theme/seal_theme_tokens.dart';

// ── Components ─────────────────────────────────────────────────────────────
export 'src/components/buttons/seal_filled_button.dart';
export 'src/components/buttons/seal_filled_icon_button.dart';
export 'src/components/buttons/seal_icon_button.dart';
export 'src/components/buttons/seal_outline_button.dart';
export 'src/components/buttons/seal_outline_icon_button.dart';
export 'src/components/buttons/seal_text_button.dart';
export 'src/components/feedback/seal_bouncing_dots.dart';
export 'src/components/feedback/seal_loader.dart';
export 'src/components/feedback/seal_snackbar.dart';
export 'src/components/inputs/seal_text_field.dart';
export 'src/components/layout/seal_card.dart';
export 'src/components/layout/seal_container.dart';
