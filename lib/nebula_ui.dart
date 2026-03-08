/// # Nebula UI
///
/// A token-driven Flutter Design System with space-inspired aesthetics.
///
/// Nebula UI provides a layered architecture of design tokens, theming, and
/// ready-to-use components — featuring purple-based palettes, subtle gradients,
/// and responsive scaling out of the box.
///
/// ## Quick start
///
/// ```dart
/// import 'package:nebula_ui/nebula_ui.dart';
///
/// MaterialApp(
///   theme: NebulaThemeFactory.dark(),
///   builder: (context, child) => NebulaTheme(
///     tokens: NebulaThemeFactory.darkTokens(),
///     child: child!,
///   ),
///   home: const MyHomePage(),
/// );
/// ```
library;

// ── Foundation ─────────────────────────────────────────────────────────────
export 'src/foundation/nebula_breakpoints.dart';
export 'src/foundation/nebula_responsive.dart';
export 'src/foundation/nebula_underline_extension.dart';

// ── Tokens · Abstractions ──────────────────────────────────────────────────
export 'src/tokens/abstractions/color_palette.dart';
export 'src/tokens/abstractions/gradient_tokens.dart';
export 'src/tokens/abstractions/typography_tokens.dart';

// ── Tokens · Base ──────────────────────────────────────────────────────────
export 'src/tokens/base/nebula_radius.dart';
export 'src/tokens/base/nebula_dimension.dart';
export 'src/tokens/base/nebula_state_color.dart';

// ── Tokens · Implementations ───────────────────────────────────────────────
export 'src/tokens/implementations/dark_color_palette.dart';
export 'src/tokens/implementations/default_gradients.dart';
export 'src/tokens/implementations/default_typography.dart';
export 'src/tokens/implementations/light_color_palette.dart';

// ── Theme ──────────────────────────────────────────────────────────────────
export 'src/theme/nebula_theme.dart';
export 'src/theme/nebula_theme_factory.dart';
export 'src/theme/nebula_theme_tokens.dart';

// ── Components ─────────────────────────────────────────────────────────────
export 'src/components/buttons/nebula_outline_button.dart';
export 'src/components/buttons/nebula_primary_button.dart';
export 'src/components/buttons/nebula_text_button.dart';
export 'src/components/feedback/nebula_bouncing_dots.dart';
export 'src/components/feedback/nebula_loader.dart';
export 'src/components/inputs/nebula_text_field.dart';
export 'src/components/layout/nebula_card.dart';
export 'src/components/layout/nebula_container.dart';
