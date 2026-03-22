# Changelog

## 0.2.0

### Buttons
- Added `.custom` factory to all 6 button types: `SealFilledButton`, `SealOutlineButton`, `SealTextButton`, `SealIconButton`, `SealFilledIconButton`, `SealOutlineIconButton`.
- `.custom` accepts `Color? color` or `LinearGradient? gradient` (at least one required).
- For filled buttons, `color`/`gradient` sets the **background** (foreground defaults to white). For outline, text, and icon buttons it sets the **foreground**.
- Gradient filled buttons now use `ShadButton.raw(gradient:)` natively; custom gradient shells removed.
- All buttons are consistently 40 px tall and shrink-wrap horizontally.

### Feedback
- **Removed** `SealSnackbar`.
- **Added** `SealAlert` — inline semantic alert widget with `.info`, `.success`, `.warning`, `.error` variants.
- **Added** `SealToast` — transient notification with `.info`, `.success`, `.warning`, `.error` variants; shown via `.show(context)`. Requires a `SealThemeScope` ancestor (which injects `ShadToaster` automatically). Supports `title`, `message`, `actionLabel`, `onAction`, `duration`, and `alignment`.

### Theme
- `SealThemeFactory.buildShadTheme()` now wires the full `ShadTextTheme` with all 13 shadcn slots.
- `TypographyTokens` expanded with shadcn-compatible aliases: `h1Large`, `h1`–`h4`, `p`, `lead`, `large`, `muted`, `blockquote`, `table`, `list`.
- `DefaultTypography` aligned with the shadcn scale (display=48/w800, headline=36/w800, title=24/w600, body=16/w400/h=1.75, small=14/w500).

### Layout
- `SealCard` footer now includes automatic top padding (`dimension.md`) so footer content does not crowd the body.

## 0.1.0

- Initial release.
- **Foundation**: `SealBreakpoints`, `SealResponsive` with responsive scale factors.
- **Tokens**: `ColorPalette` (dark & light), `TypographyTokens`, `GradientTokens`, `SealDimension`, `SealRadius`.
- **Theme**: `SealTheme` InheritedWidget, `SealThemeFactory`, `SealThemeTokens`.
- **Components**: `SealPrimaryButton`, `SealTextField`, `SealContainer`, `SealLoader`.
- **Extensions**: `context.themeTokens`, `context.dimension`, `SealDimensionDouble` gap helpers.
