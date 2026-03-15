# Seal UI — Estrutura do Projeto

**Pacote Flutter (Design System token-driven), arquitetura em camadas: `foundation → tokens → theme → components`.**

---

## `lib/src/` — Código-fonte do pacote

```
foundation/
  seal_breakpoints.dart
  seal_responsive.dart
  seal_underline_extension.dart

tokens/
  abstractions/    → color_palette.dart, gradient_tokens.dart, typography_tokens.dart
  base/            → seal_dimension.dart, seal_radius.dart, seal_state_color.dart
  implementations/ → dark_color_palette.dart, dark_gradients.dart, default_typography.dart,
                     light_color_palette.dart, light_gradients.dart

theme/
  seal_theme.dart, seal_theme_factory.dart, seal_theme_tokens.dart

components/
  buttons/  → seal_filled_button, seal_filled_icon_button, seal_icon_button,
               seal_outline_button, seal_outline_icon_button, seal_text_button
  feedback/ → seal_bouncing_dots, seal_loader, seal_snackbar
  inputs/   → seal_text_field
  layout/   → seal_card, seal_container
```

**Barrel file:** `lib/seal_ui.dart` exporta todas as camadas com exceção de `src/` internals.

---

## `test/` — Testes

`widget_test.dart` na raiz + espelho 1:1 de `lib/src/components/` em `test/components/`:

```
widget_test.dart
components/
  buttons/  → seal_filled_button_test, seal_filled_icon_button_test, seal_icon_button_test,
               seal_outline_button_test, seal_outline_icon_button_test, seal_text_button_test
  feedback/ → seal_bouncing_dots_test, seal_loader_test, seal_snackbar_test
  inputs/   → seal_text_field_test
  layout/   → seal_card_test, seal_container_test
```

---

## `example/` — App de exemplo e Widgetbook

```
lib/
  main.dart
  sections/ → buttons_section, cards_section, containers_section,
               inputs_section, loader_section, snackbar_section

widgetbook/
  widgetbook_app.dart
  seal_documentation_addon.dart
  categories/ → components_category.dart, layout_category.dart, tokens_category.dart

assets/markdown/
  components/
    buttons/
      sealfilledbutton/     → primary, accent, gradient, accent-secondary, accent-gradient, with-icon
      sealfillediconbutton/ → primary, accent, gradient, accent-secondary, accent-gradient
      sealiconbutton/       → primary, accent, gradient, accent-secondary, accent-gradient
      sealoutlinebutton/    → primary, accent, gradient, accent-secondary, accent-gradient, with-icon
      sealoutlineiconbutton/→ primary, accent, gradient, accent-secondary, accent-gradient
      sealtextbutton/       → primary, accent, gradient, accent-secondary, accent-gradient, with-icon
    feedback/
      sealloader/           → default
      sealsnackbar/         → custom, error, info, success, warning
    inputs/
      sealtextfield/        → default, password
  layout/
    cards/sealcard/           → default, tappable, with-gradient
    containers/sealcontainer/ → default, with-gradient
    spacing/spacing-scale/    → visual-guide
```

---

## Dependências principais

| Pacote | Uso |
|---|---|
| `google_fonts` | Família Inter (tipografia) |
| `widgetbook ^3.10.0` | Catálogo de componentes |
| `widgetbook_documentation_addon ^1.0.1+2` | Docs inline no Widgetbook |
| `flutter_lints ^6.0.0` | Análise estática |

---

## Convenções-chave

- Prefixo `Seal` em todas as classes públicas; `seal_` em snake_case nos arquivos.
- Tokens via `context.themeTokens`; espaçamento via `context.dimension`.
- Markdown docs: `example/assets/markdown/<category>/<folder>/<component>/<use-case>.md` (tudo lowercase, espaços → `-`).
- Novo componente segue checklist de 7 etapas: widget → export → test → widgetbook → markdown → example app → analyze/test.
