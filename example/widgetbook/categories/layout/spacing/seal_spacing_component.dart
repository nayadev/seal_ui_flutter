import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealSpacingComponent extends WidgetbookComponent {
  SealSpacingComponent()
    : super(
        name: 'Spacing Scale',
        useCases: [
          WidgetbookUseCase(
            name: 'Visual Guide',
            builder: (context) {
              final tokens = context.themeTokens;
              final dimension = context.dimension;
              final entries = <String, double>{
                'xxxs (2)': dimension.xxxs,
                'xxs (4)': dimension.xxs,
                'xs (8)': dimension.xs,
                'sm (12)': dimension.sm,
                'md (16)': dimension.md,
                'lg (24)': dimension.lg,
                'xl (32)': dimension.xl,
                'xxl (48)': dimension.xxl,
                'xxxl (64)': dimension.xxxl,
              };

              return SingleChildScrollView(
                padding: EdgeInsets.all(dimension.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: entries.entries.map((e) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: dimension.sm),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              e.key,
                              style: tokens.typography.caption.copyWith(
                                color: tokens.colors.textSecondary,
                              ),
                            ),
                          ),
                          Container(
                            width: e.value,
                            height: dimension.md,
                            decoration: BoxDecoration(
                              color: tokens.colors.primary,
                              borderRadius: SealRadius.borderRadiusXs,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      );
}
