import 'package:flutter/painting.dart';

/// Abstract contract for Seal UI typography tokens.
///
/// Provides two naming layers that stay in sync:
/// - **SealUI scale** (`display`, `headline`, `title`, `subtitle`, `body`,
///   `small`, `caption`) — semantic names used throughout the design system.
/// - **shadcn-compatible** (`h1Large`, `h1` … `h4`, `p`, `lead`, `large`,
///   `small`, `muted`, `blockquote`, `table`, `list`) — matching the
///   [ShadTextTheme] API so that shadcn_ui components receive the correct
///   Inter-based styles automatically.
///
/// Implementations override the **SealUI scale** getters; the shadcn aliases
/// derive from them by default and can be overridden for fine-grained control.
abstract class TypographyTokens {
  const TypographyTokens();

  /// Flutter's default line height multiplier when [TextStyle.height] is null.
  static const double kDefaultLineHeightMultiplier = 1.2;

  /// Default font size for body text, used as a fallback.
  static const double kBodyFontSize = 16;

  /// Default button icon size shared across all Seal button components.
  static const double kDefaultButtonIconSize = 18;

  // ── SealUI scale (abstract — must implement) ──────────────────────────────

  /// Large display text — hero sections. Matches [h1Large] (48 px).
  TextStyle get display;

  /// Headline — primary section heading. Closest to [h1] / [h2].
  TextStyle get headline;

  /// Title — card or dialog headings. Matches [h3] (24 px).
  TextStyle get title;

  /// Subtitle — subsection headings. Matches [h4] (20 px).
  TextStyle get subtitle;

  /// Body — default readable paragraph text. Matches [p] (16 px).
  TextStyle get body;

  /// Small — secondary / supporting information. Matches shadcn [small] (14 px).
  TextStyle get small;

  /// Caption — labels and metadata. Closest to [muted] (14 px w400).
  TextStyle get caption;

  // ── shadcn-compatible aliases (default implementations) ───────────────────
  //
  // These map 1-to-1 onto [ShadTextTheme] fields and are wired into shadcn
  // via [SealThemeFactory.buildShadTheme]. Override any getter in a concrete
  // subclass for per-theme fine-tuning.

  /// Largest heading — 48 px, w800. Delegates to [display].
  TextStyle get h1Large => display;

  /// Primary heading — 36 px, w800. Delegates to [headline].
  TextStyle get h1 => headline;

  /// Secondary heading — 30 px, w600. Delegates to [headline].
  TextStyle get h2 => headline;

  /// Tertiary heading — 24 px, w600. Delegates to [title].
  TextStyle get h3 => title;

  /// Quaternary heading — 20 px, w600. Delegates to [subtitle].
  TextStyle get h4 => subtitle;

  /// Paragraph / body text — 16 px, w400. Delegates to [body].
  TextStyle get p => body;

  /// Lead paragraph — larger intro text. Delegates to [subtitle].
  TextStyle get lead => subtitle;

  /// Large label / section intro — 18 px, w600. Delegates to [subtitle].
  TextStyle get large => subtitle;

  /// Muted / de-emphasised text — 14 px, w400. Derives from [small].
  TextStyle get muted => small.copyWith(fontWeight: FontWeight.w400);

  /// Block-quote — body italic. Derives from [body].
  TextStyle get blockquote => body.copyWith(fontStyle: FontStyle.italic);

  /// Table header — body bold. Derives from [body].
  TextStyle get table => body.copyWith(fontWeight: FontWeight.w700);

  /// List item — same as body. Delegates to [body].
  TextStyle get list => body;
}
