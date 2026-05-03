import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealGradientsComponent extends WidgetbookComponent {
  SealGradientsComponent()
    : super(
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
      );
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
