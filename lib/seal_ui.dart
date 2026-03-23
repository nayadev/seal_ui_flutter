/// # Seal UI
///
/// A token-driven Flutter Design System with bold, curated themes.
///
/// Seal UI provides a layered architecture of design tokens, theming, and
/// ready-to-use components — featuring expressive palettes, subtle gradients,
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
export 'src/tokens/implementations/default_typography.dart';

// ── Theme ──────────────────────────────────────────────────────────────────
export 'src/theme/seal_theme_controller.dart';
export 'src/theme/seal_theme_factory.dart';
export 'src/theme/seal_theme_provider.dart';
export 'src/theme/seal_theme_tokens.dart';

// ── Themes · Nebula ────────────────────────────────────────────────────────
export 'src/theme/themes/nebula/nebula_theme_factory.dart';
export 'src/theme/themes/nebula/tokens/nebula_color_palette.dart';
export 'src/theme/themes/nebula/tokens/nebula_gradients.dart';
export 'src/theme/themes/nebula/tokens/nebula_light_color_palette.dart';
export 'src/theme/themes/nebula/tokens/nebula_light_gradients.dart';

// ── Themes · Arctic ────────────────────────────────────────────────────────
export 'src/theme/themes/arctic/arctic_theme_factory.dart';
export 'src/theme/themes/arctic/tokens/arctic_color_palette.dart';
export 'src/theme/themes/arctic/tokens/arctic_dark_color_palette.dart';
export 'src/theme/themes/arctic/tokens/arctic_gradients.dart';
export 'src/theme/themes/arctic/tokens/arctic_light_gradients.dart';

// ── Themes · Deep Ocean ────────────────────────────────────────────────────
export 'src/theme/themes/deep_ocean/deep_ocean_theme_factory.dart';
export 'src/theme/themes/deep_ocean/tokens/deep_ocean_color_palette.dart';
export 'src/theme/themes/deep_ocean/tokens/deep_ocean_gradients.dart';
export 'src/theme/themes/deep_ocean/tokens/deep_ocean_light_color_palette.dart';
export 'src/theme/themes/deep_ocean/tokens/deep_ocean_light_gradients.dart';

// ── Themes · Terminal ──────────────────────────────────────────────────────
export 'src/theme/themes/terminal/terminal_theme_factory.dart';
export 'src/theme/themes/terminal/tokens/terminal_color_palette.dart';
export 'src/theme/themes/terminal/tokens/terminal_gradients.dart';
export 'src/theme/themes/terminal/tokens/terminal_light_color_palette.dart';
export 'src/theme/themes/terminal/tokens/terminal_light_gradients.dart';

// ── Components ─────────────────────────────────────────────────────────────

// Buttons
export 'src/components/buttons/seal_filled_button.dart';
export 'src/components/buttons/seal_filled_icon_button.dart';
export 'src/components/buttons/seal_icon_button.dart';
export 'src/components/buttons/seal_outline_button.dart';
export 'src/components/buttons/seal_outline_icon_button.dart';
export 'src/components/buttons/seal_text_button.dart';

// Feedback
export 'src/components/feedback/seal_alert.dart';
export 'src/components/feedback/seal_sonner.dart';
export 'src/components/feedback/seal_bouncing_dots.dart';
export 'src/components/feedback/seal_loader.dart';
export 'src/components/feedback/seal_progress.dart';
export 'src/components/feedback/seal_toast.dart';

// Inputs
export 'src/components/inputs/seal_calendar.dart';
export 'src/components/inputs/seal_form.dart';
export 'src/components/inputs/seal_date_picker.dart';
export 'src/components/inputs/seal_time_picker.dart';
export 'src/components/inputs/seal_checkbox.dart';
export 'src/components/inputs/seal_input_otp.dart';
export 'src/components/inputs/seal_radio_group.dart';
export 'src/components/inputs/seal_select.dart';
export 'src/components/inputs/seal_slider.dart';
export 'src/components/inputs/seal_switch.dart';
export 'src/components/inputs/seal_textarea.dart';
export 'src/components/inputs/seal_text_field.dart';

// Interaction
export 'src/components/interaction/seal_pressable.dart';
export 'src/components/interaction/seal_tooltip.dart';

// Overlay
export 'src/components/overlay/seal_context_menu.dart';
export 'src/components/overlay/seal_dialog.dart';
export 'src/components/overlay/seal_popover.dart';
export 'src/components/overlay/seal_sheet.dart';

// Layout
export 'src/components/layout/seal_accordion.dart';
export 'src/components/layout/seal_menubar.dart';
export 'src/components/layout/seal_resizable.dart';
export 'src/components/layout/seal_avatar.dart';
export 'src/components/layout/seal_breadcrumb.dart';
export 'src/components/layout/seal_badge.dart';
export 'src/components/layout/seal_card.dart';
export 'src/components/layout/seal_container.dart';
export 'src/components/layout/seal_separator.dart';
export 'src/components/layout/seal_table.dart';
export 'src/components/layout/seal_tabs.dart';
