import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealCardComponent extends WidgetbookComponent {
  SealCardComponent()
    : super(
        name: 'SealCard',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final tokens = context.themeTokens;
              final colors = tokens.colors;
              final typo = tokens.typography;
              return Center(
                child: SealCard(
                  showBorder: context.knobs.boolean(
                    label: 'Show Border',
                    initialValue: true,
                  ),
                  elevation: context.knobs.object.dropdown<double>(
                    label: 'Elevation',
                    options: [0, 2, 4, 8],
                    initialOption: 2,
                    labelBuilder: (v) => v.toString(),
                  ),
                  header: Text(
                    context.knobs.string(
                      label: 'Header',
                      initialValue: 'Card Title',
                    ),
                    style: typo.title.copyWith(color: colors.textPrimary),
                  ),
                  body: Text(
                    'This is the card body with some descriptive content.',
                    style: typo.body.copyWith(color: colors.textSecondary),
                  ),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SealTextButton.primary(
                        label: const Text('Cancel'),
                        onPressed: () {},
                      ),
                      context.dimension.xs.horizontalGap,
                      SealFilledButton.primary(
                        label: const Text('Confirm'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'With Gradient',
            builder: (context) {
              final tokens = context.themeTokens;
              final colors = tokens.colors;
              final typo = tokens.typography;
              return Center(
                child: SealCard(
                  gradient: tokens.gradients.surfaceGradient,
                  showBorder: false,
                  header: Text(
                    'Gradient Card',
                    style: typo.title.copyWith(color: colors.textPrimary),
                  ),
                  body: Text(
                    'A card with a gradient background.',
                    style: typo.body.copyWith(color: colors.textPrimary),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Tappable',
            builder: (context) {
              final tokens = context.themeTokens;
              final colors = tokens.colors;
              final typo = tokens.typography;
              return Center(
                child: SealCard(
                  onTap: () {},
                  header: Row(
                    children: [
                      Icon(LucideIcons.pointer, color: colors.primary),
                      SizedBox(width: context.dimension.xs),
                      Expanded(
                        child: Text(
                          'Tappable Card',
                          style: typo.title.copyWith(color: colors.textPrimary),
                        ),
                      ),
                    ],
                  ),
                  body: Text(
                    'Tap this card to trigger an action.',
                    style: typo.body.copyWith(color: colors.textSecondary),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
