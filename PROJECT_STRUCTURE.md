# Seal UI — Estrutura do Projeto

**Pacote Flutter (Design System token-driven), arquitetura em camadas: `foundation → tokens → theme → components`.**

---

## `lib/src/` — Código-fonte do pacote

```
foundation/
  seal_breakpoints.dart
  seal_responsive.dart

tokens/
  abstractions/    → color_palette.dart, gradient_tokens.dart, typography_tokens.dart
  base/            → seal_colors.dart, seal_dimension.dart, seal_radius.dart, seal_state_color.dart
  implementations/ → dark_color_palette.dart, dark_gradients.dart, default_typography.dart,
                     light_color_palette.dart, light_gradients.dart

theme/
  seal_theme_controller.dart, seal_theme_factory.dart,
  seal_theme_provider.dart, seal_theme_tokens.dart
  themes/
    arctic/       → arctic_theme_factory.dart + tokens/
    deep_ocean/   → deep_ocean_theme_factory.dart + tokens/
    nebula/       → nebula_theme_factory.dart + tokens/
    terminal/     → terminal_theme_factory.dart + tokens/

components/
  buttons/
    seal_filled_button.dart
    seal_filled_icon_button.dart
    seal_icon_button.dart
    seal_outline_button.dart
    seal_outline_icon_button.dart
    seal_text_button.dart
  feedback/
    seal_alert.dart
    seal_bouncing_dots.dart   ← internal
    seal_loader.dart
    seal_progress.dart
    seal_toast.dart
  inputs/
    seal_checkbox.dart
    seal_radio_group.dart
    seal_select.dart
    seal_slider.dart
    seal_switch.dart
    seal_text_field.dart
    seal_textarea.dart
  interaction/
    seal_pressable.dart       ← internal
    seal_tooltip.dart
  layout/
    seal_accordion.dart
    seal_avatar.dart
    seal_badge.dart
    seal_card.dart
    seal_container.dart
    seal_separator.dart
    seal_tabs.dart
  overlay/
    seal_dialog.dart
    seal_sheet.dart
```

**Barrel file:** `lib/seal_ui.dart` exporta todas as camadas públicas; internals de `src/` permanecem privados.

---

## `test/` — Testes

```
widget_test.dart
components/
  buttons/     → seal_filled_button_test, seal_filled_icon_button_test, seal_icon_button_test,
                 seal_outline_button_test, seal_outline_icon_button_test, seal_text_button_test
  feedback/    → seal_bouncing_dots_test, seal_loader_test, seal_progress_test, seal_snackbar_test
  inputs/      → seal_checkbox_test, seal_radio_group_test, seal_select_test, seal_slider_test,
                 seal_switch_test, seal_text_field_test, seal_textarea_test
  interaction/ → seal_tooltip_test
  layout/      → seal_accordion_test, seal_avatar_test, seal_badge_test,
                 seal_card_test, seal_container_test, seal_tabs_test
  overlay/     → seal_dialog_test, seal_sheet_test
```

---

## `example/` — App de exemplo e Widgetbook

```
lib/
  main.dart
  sections/
    buttons_section.dart
    feedback_section.dart   → SealAlert, SealLoader, SealProgress, SealToast
    inputs_section.dart     → SealCheckbox, SealRadioGroup, SealSelect, SealSlider,
                              SealSwitch, SealTextarea, SealTextField
    layout_section.dart     → SealAccordion, SealAvatar, SealBadge, SealCard,
                              SealContainer, SealTabs
    overlay_section.dart    → SealDialog, SealSheet

widgetbook/
  widgetbook_app.dart
  seal_documentation_addon.dart
  categories/
    components_category.dart  → Buttons, Feedback, Inputs, Interaction, Overlay
    layout_category.dart      → Accordion, Avatars, Badges, Cards, Containers, Spacing, Tabs
    tokens_category.dart      → Colors, Gradients, Typography

assets/markdown/
  components/
    buttons/
      sealfilledbutton/      → primary, accent, accent-secondary, gradient, accent-gradient, with-icon, custom
      sealfillediconbutton/  → primary, accent, accent-secondary, gradient, accent-gradient, custom
      sealiconbutton/        → primary, accent, accent-secondary, gradient, accent-gradient, custom
      sealoutlinebutton/     → primary, accent, accent-secondary, gradient, accent-gradient, with-icon, custom
      sealoutlineiconbutton/ → primary, accent, accent-secondary, gradient, accent-gradient, custom
      sealtextbutton/        → primary, accent, accent-secondary, gradient, accent-gradient, with-icon, custom
    feedback/
      sealalert/             → info, success, warning, error
      sealloader/            → default
      sealprogress/          → determinate, indeterminate
      sealtoast/             → info, success, warning, error
    inputs/
      sealcheckbox/          → default, with-label
      sealradiogroup/        → default, horizontal
      sealselect/            → default, with-label
      sealslider/            → default, stepped
      sealswitch/            → default, with-label
      sealtextarea/          → default, with-label
      sealtextfield/         → default, password
    interaction/
      sealtooltip/           → default, custom
    overlay/
      sealdialog/            → default, alert
      sealsheet/             → bottom, right
  layout/
    accordion/sealaccordion/    → default, multiple
    avatars/sealavatar/         → default, sizes
    badges/sealbadge/           → variants, interactive
    cards/sealcard/             → default, with-gradient, tappable
    containers/sealcontainer/   → default, with-gradient
    spacing/spacing-scale/      → visual-guide
    tabs/sealtabs/              → default, with-disabled-tab
```

---

## Dependências principais

| Pacote | Uso |
|---|---|
| `shadcn_ui` | Primitivos de componente e sistema de tema base |
| `google_fonts` | Família Inter (tipografia) |
| `widgetbook` | Catálogo de componentes |
| `widgetbook_documentation_addon` | Docs inline no Widgetbook |
| `flutter_lints` | Análise estática |

---

## Convenções-chave

- Prefixo `Seal` em todas as classes públicas; `seal_` em snake_case nos arquivos.
- Tokens via `context.themeTokens`; espaçamento via `context.dimension`.
- Nunca importar `package:flutter/material.dart` em `lib/` — usar `widgets.dart`, `painting.dart` ou `dart:ui`.
- Markdown docs: `example/assets/markdown/<category>/<folder>/<component>/<use-case>.md` (tudo lowercase, espaços → `-`).
- Novo componente segue checklist de 7 etapas: widget → export → test → widgetbook → markdown → example app → analyze/test.
