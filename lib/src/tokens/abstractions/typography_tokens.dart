import 'package:flutter/painting.dart';

/// Abstract contract for Seal UI typography tokens.
///
/// Provides two naming layers that stay in sync:
/// - **SealUI scale** (`display`, `headline`, `heading`, `title`, `subtitle`,
///   `bodyLarge`, `lead`, `body`, `small`, `caption`) — semantic names used
///   throughout the design system.
/// - **shadcn-compatible** (`h1Large`, `h1` … `h4`, `p`, `lead`, `large`,
///   `small`, `muted`, `blockquote`, `table`, `list`) — matching the
///   [ShadTextTheme] API so that shadcn_ui components receive the correct
///   Inter-based styles automatically.
///
/// Implementations override the **SealUI scale** getters; the shadcn aliases
/// derive from them by default and can be overridden for fine-grained control.
///
/// Scale reference (shadcn → SealUI name):
/// | shadcn     | SealUI     | size | weight |
/// |------------|------------|------|--------|
/// | h1Large    | display    |  48  |  w800  |
/// | h1         | headline   |  36  |  w800  |
/// | h2         | heading    |  30  |  w600  |
/// | h3         | title      |  24  |  w600  |
/// | h4         | subtitle   |  20  |  w600  |
/// | large      | bodyLarge  |  18  |  w600  |
/// | lead       | lead       |  20  |  w400  |
/// | p          | body       |  16  |  w400  |
/// | small      | small      |  14  |  w500  |
/// | muted      | caption    |  14  |  w400  |
abstract class TypographyTokens {
  const TypographyTokens();

  /// Flutter's default line height multiplier when [TextStyle.height] is null.
  static const double kDefaultLineHeightMultiplier = 1.2;

  /// Default font size for body text, used as a fallback.
  static const double kBodyFontSize = 16;

  /// Default font size for small / caption text, used as a fallback.
  static const double kSmallFontSize = 14;

  /// Default button icon size shared across all Seal button components.
  static const double kDefaultButtonIconSize = 18;

  // ── SealUI scale (abstract — must implement) ──────────────────────────────

  /// Large display text — hero sections. Matches [h1Large] (48 px, w800).
  TextStyle get display;

  /// Headline — primary section heading. Matches [h1] (36 px, w800).
  TextStyle get headline;

  /// Heading — secondary section heading. Matches [h2] (30 px, w600).
  ///
  /// Sits between [headline] (36 px) and [title] (24 px).
  TextStyle get heading;

  /// Title — card or dialog headings. Matches [h3] (24 px, w600).
  TextStyle get title;

  /// Subtitle — subsection headings. Matches [h4] (20 px, w600).
  TextStyle get subtitle;

  /// Body large — emphasized body text, section intros. Matches [large]
  /// (18 px, w600). Sits between [subtitle] (20 px) and [body] (16 px).
  TextStyle get bodyLarge;

  /// Lead — introductory paragraph text. Matches [lead] (20 px, w400).
  ///
  /// Same size as [subtitle] but with regular weight, used for lead-in copy.
  TextStyle get lead;

  /// Body — default readable paragraph text. Matches [p] (16 px, w400).
  TextStyle get body;

  /// Small — secondary / supporting information. Matches shadcn [small]
  /// (14 px, w500).
  TextStyle get small;

  /// Caption — labels and metadata. Closest to [muted] (14 px, w400).
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

  /// Secondary heading — 30 px, w600. Delegates to [heading].
  TextStyle get h2 => heading;

  /// Tertiary heading — 24 px, w600. Delegates to [title].
  TextStyle get h3 => title;

  /// Quaternary heading — 20 px, w600. Delegates to [subtitle].
  TextStyle get h4 => subtitle;

  /// Paragraph / body text — 16 px, w400. Delegates to [body].
  TextStyle get p => body;

  /// Large label / section intro — 18 px, w600. Delegates to [bodyLarge].
  TextStyle get large => bodyLarge;

  /// Muted / de-emphasised text — 14 px, w400. Derives from [caption].
  TextStyle get muted => caption;

  /// Block-quote — italic body text, 16 px, h=24/16. Derives from [body].
  TextStyle get blockquote =>
      body.copyWith(fontStyle: FontStyle.italic, height: _kCompactBodyHeight);

  /// Table text — bold body text, 16 px, h=24/16. Derives from [body].
  TextStyle get table =>
      body.copyWith(fontWeight: FontWeight.w700, height: _kCompactBodyHeight);

  /// List item — body text at compact line height, 16 px, h=24/16.
  ///
  /// Slightly tighter than [body] (h=28/16) to suit list layouts.
  TextStyle get list => body.copyWith(height: _kCompactBodyHeight);

  // ── Internal ──────────────────────────────────────────────────────────────

  /// Line-height ratio used for [blockquote], [table], and [list] styles.
  ///
  /// Matches the shadcn_ui default (24 / 16 ≈ 1.5) which is tighter than
  /// the [body] line-height (28 / 16 ≈ 1.75).
  static const double _kCompactBodyHeight = 24 / 16;
}
