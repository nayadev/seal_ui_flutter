import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:seal_ui/seal_ui.dart';

/// Builds the **Tokens** category for the Widgetbook catalog.
WidgetbookCategory buildTokensCategory() {
  return WidgetbookCategory(
    name: 'Tokens',
    children: [
      _buildColorsFolder(),
      _buildTypographyFolder(),
      _buildGradientsFolder(),
    ],
  );
}

// ── Colors ───────────────────────────────────────────────────────────────────

WidgetbookFolder _buildColorsFolder() {
  return WidgetbookFolder(
    name: 'Colors',
    children: [
      WidgetbookComponent(
        name: 'Palette Overview',
        useCases: [
          WidgetbookUseCase(
            name: 'All Colors',
            builder: (context) {
              final tokens = context.themeTokens;
              final dimension = context.dimension;
              final colors = tokens.colors;
              final entries = <String, Color>{
                'primary': colors.primary,
                'primaryTint': colors.primaryTint,
                'primaryShade': colors.primaryShade,
                'accent': colors.accent,
                'accentSecondary': colors.accentSecondary,
                'background': colors.background,
                'surface': colors.surface,
                'surfaceAlt': colors.surfaceAlt,
                'textPrimary': colors.textPrimary,
                'textSecondary': colors.textSecondary,
                'border': colors.border,
                'success': colors.success,
                'warning': colors.warning,
                'error': colors.error,
              };

              return SingleChildScrollView(
                padding: EdgeInsets.all(dimension.lg),
                child: Wrap(
                  spacing: dimension.sm,
                  runSpacing: dimension.sm,
                  children: entries.entries.map((e) {
                    return _ColorSwatch(
                      name: e.key,
                      color: e.value,
                      textColor: tokens.colors.textPrimary,
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

// ── Typography ───────────────────────────────────────────────────────────────

WidgetbookFolder _buildTypographyFolder() {
  return WidgetbookFolder(
    name: 'Typography',
    children: [
      WidgetbookComponent(
        name: 'Type Scale',
        useCases: [
          WidgetbookUseCase(
            name: 'All Styles',
            builder: (context) {
              final tokens = context.themeTokens;
              final dimension = context.dimension;
              final typo = tokens.typography;
              final color = tokens.colors.textPrimary;

              return SingleChildScrollView(
                padding: EdgeInsets.all(dimension.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Display', style: typo.display.copyWith(color: color)),
                    dimension.md.verticalGap,
                    Text(
                      'Headline',
                      style: typo.headline.copyWith(color: color),
                    ),
                    dimension.md.verticalGap,
                    Text('Title', style: typo.title.copyWith(color: color)),
                    dimension.md.verticalGap,
                    Text(
                      'Subtitle — Subsection headings',
                      style: typo.subtitle.copyWith(color: color),
                    ),
                    dimension.md.verticalGap,
                    Text(
                      'Body — The quick brown fox jumps over the lazy dog.',
                      style: typo.body.copyWith(color: color),
                    ),
                    dimension.md.verticalGap,
                    Text(
                      'Small — The quick brown fox jumps over the lazy dog.',
                      style: typo.small.copyWith(color: color),
                    ),
                    dimension.md.verticalGap,
                    Text(
                      'CAPTION — METADATA & LABELS',
                      style: typo.caption.copyWith(color: color),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

// ── Gradients ────────────────────────────────────────────────────────────────

WidgetbookFolder _buildGradientsFolder() {
  return WidgetbookFolder(
    name: 'Gradients',
    children: [
      WidgetbookComponent(
        name: 'Gradient Preview',
        useCases: [
          WidgetbookUseCase(
            name: 'All Gradients',
            builder: (context) {
              final tokens = context.themeTokens;
              final dimension = context.dimension;
              final gradients = tokens.gradients;

              return SingleChildScrollView(
                padding: EdgeInsets.all(dimension.lg),
                child: Column(
                  children: [
                    _GradientPreview(
                      label: 'Primary Gradient',
                      gradient: gradients.primaryGradient,
                      textColor: tokens.colors.textPrimary,
                    ),
                    dimension.md.verticalGap,
                    _GradientPreview(
                      label: 'Accent Gradient',
                      gradient: gradients.accentGradient,
                      textColor: tokens.colors.textPrimary,
                    ),
                    dimension.md.verticalGap,
                    _GradientPreview(
                      label: 'Surface Gradient',
                      gradient: gradients.surfaceGradient,
                      textColor: tokens.colors.textPrimary,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

// ── Helper widgets ───────────────────────────────────────────────────────────

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.name,
    required this.color,
    required this.textColor,
  });

  final String name;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: color,
            borderRadius: SealRadius.borderRadiusSm,
            border: Border.all(color: textColor.withValues(alpha: 0.12)),
          ),
        ),
        context.dimension.xxs.verticalGap,
        Text(name, style: TextStyle(fontSize: 10, color: textColor)),
      ],
    );
  }
}

class _GradientPreview extends StatelessWidget {
  const _GradientPreview({
    required this.label,
    required this.gradient,
    required this.textColor,
  });

  final String label;
  final LinearGradient gradient;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: SealRadius.borderRadiusMd,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
