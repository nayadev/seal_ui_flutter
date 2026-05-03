import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealColorsComponent extends WidgetbookComponent {
  SealColorsComponent()
    : super(
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
                  children: entries.entries
                      .map(
                        (e) => _ColorSwatch(
                          name: e.key,
                          color: e.value,
                          textColor: tokens.colors.textPrimary,
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      );
}

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
