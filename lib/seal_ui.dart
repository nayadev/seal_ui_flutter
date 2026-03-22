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
/// ShadApp(
///   builder: (context, child) => SealThemeScope(
///     tokens: SealThemeFactory.darkTokens(),
///     child: child!,
///   ),
///   home: const MyHomePage(),
/// )
/// ```
library;

// ── Icons ───────────────────────────────────────────────────────────────────
export 'package:lucide_icons_flutter/lucide_icons.dart';

// ── Foundation ─────────────────────────────────────────────────────────────
export 'src/foundation/seal_breakpoints.dart';
export 'src/foundation/seal_responsive.dart';
export 'src/foundation/seal_underline_extension.dart';

// ── Tokens · Abstractions ──────────────────────────────────────────────────
export 'src/tokens/abstractions/color_palette.dart';
export 'src/tokens/abstractions/gradient_tokens.dart';
export 'src/tokens/abstractions/typography_tokens.dart';

// ── Tokens · Base ──────────────────────────────────────────────────────────
export 'src/tokens/base/seal_colors.dart';
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
export 'src/theme/seal_theme_controller.dart';
export 'src/theme/seal_theme_factory.dart';
export 'src/theme/seal_theme_provider.dart';
export 'src/theme/seal_theme_tokens.dart';

// ── Themes · Nebula ────────────────────────────────────────────────────────
export 'src/themes/nebula/nebula_theme_factory.dart';
export 'src/themes/nebula/tokens/nebula_color_palette.dart';
export 'src/themes/nebula/tokens/nebula_gradients.dart';
export 'src/themes/nebula/tokens/nebula_light_color_palette.dart';
export 'src/themes/nebula/tokens/nebula_light_gradients.dart';

// ── Themes · Arctic ────────────────────────────────────────────────────────
export 'src/themes/arctic/arctic_theme_factory.dart';
export 'src/themes/arctic/tokens/arctic_color_palette.dart';
export 'src/themes/arctic/tokens/arctic_dark_color_palette.dart';
export 'src/themes/arctic/tokens/arctic_gradients.dart';
export 'src/themes/arctic/tokens/arctic_light_gradients.dart';

// ── Themes · Deep Ocean ────────────────────────────────────────────────────
export 'src/themes/deep_ocean/deep_ocean_theme_factory.dart';
export 'src/themes/deep_ocean/tokens/deep_ocean_color_palette.dart';
export 'src/themes/deep_ocean/tokens/deep_ocean_gradients.dart';
export 'src/themes/deep_ocean/tokens/deep_ocean_light_color_palette.dart';
export 'src/themes/deep_ocean/tokens/deep_ocean_light_gradients.dart';

// ── Components ─────────────────────────────────────────────────────────────
export 'src/components/buttons/seal_filled_button.dart';
export 'src/components/buttons/seal_filled_icon_button.dart';
export 'src/components/buttons/seal_icon_button.dart';
export 'src/components/buttons/seal_outline_button.dart';
export 'src/components/buttons/seal_outline_icon_button.dart';
export 'src/components/buttons/seal_text_button.dart';
export 'src/components/feedback/seal_alert.dart';
export 'src/components/feedback/seal_bouncing_dots.dart';
export 'src/components/feedback/seal_loader.dart';
export 'src/components/feedback/seal_toast.dart';
export 'src/components/inputs/seal_text_field.dart';
export 'src/components/interaction/seal_pressable.dart';
export 'src/components/layout/seal_card.dart';
export 'src/components/layout/seal_container.dart';
export 'src/components/layout/seal_divider.dart';
