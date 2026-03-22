import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:seal_ui/seal_ui.dart';

/// Builds the **Layout** category for the Widgetbook catalog.
WidgetbookCategory buildLayoutCategory() {
  return WidgetbookCategory(
    name: 'Layout',
    children: [
      _buildAvatarsFolder(),
      _buildBadgesFolder(),
      _buildCardsFolder(),
      _buildContainersFolder(),
      _buildSpacingFolder(),
    ],
  );
}

// ── Avatars ──────────────────────────────────────────────────────────────────

WidgetbookFolder _buildAvatarsFolder() {
  return WidgetbookFolder(
    name: 'Avatars',
    children: [
      WidgetbookComponent(
        name: 'SealAvatar',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => SealAvatar(
              src: context.knobs.string(
                label: 'Image URL',
                initialValue: 'https://i.pravatar.cc/150',
              ),
              placeholder: const Text('JD'),
            ),
          ),
          WidgetbookUseCase(
            name: 'Sizes',
            builder: (context) => Wrap(
              spacing: context.dimension.md,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                SealAvatar.small(src: '', placeholder: Text('S')),
                SealAvatar(src: '', placeholder: Text('M')),
                SealAvatar.large(src: '', placeholder: Text('L')),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

// ── Badges ───────────────────────────────────────────────────────────────────

WidgetbookFolder _buildBadgesFolder() {
  return WidgetbookFolder(
    name: 'Badges',
    children: [
      WidgetbookComponent(
        name: 'SealBadge',
        useCases: [
          WidgetbookUseCase(
            name: 'Variants',
            builder: (context) => Wrap(
              spacing: context.dimension.sm,
              runSpacing: context.dimension.sm,
              children: [
                SealBadge.primary(
                  child: Text(context.knobs.string(
                    label: 'Label',
                    initialValue: 'Primary',
                  )),
                ),
                const SealBadge.accent(child: Text('Accent')),
                const SealBadge.secondary(child: Text('Secondary')),
                const SealBadge.outline(child: Text('Outline')),
                const SealBadge.success(child: Text('Active')),
                const SealBadge.warning(child: Text('Pending')),
                const SealBadge.error(child: Text('Expired')),
              ],
            ),
          ),
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) => SealBadge.primary(
              child: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Clickable',
              )),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );
}

// ── Cards ────────────────────────────────────────────────────────────────────

WidgetbookFolder _buildCardsFolder() {
  return WidgetbookFolder(
    name: 'Cards',
    children: [
      WidgetbookComponent(
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
      ),
    ],
  );
}

// ── Containers ───────────────────────────────────────────────────────────────

WidgetbookFolder _buildContainersFolder() {
  return WidgetbookFolder(
    name: 'Containers',
    children: [
      WidgetbookComponent(
        name: 'SealContainer',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final tokens = context.themeTokens;
              return Center(
                child: SealContainer(
                  showBorder: context.knobs.boolean(
                    label: 'Show Border',
                    initialValue: true,
                  ),
                  child: Text(
                    'Seal UI Container',
                    style: tokens.typography.body.copyWith(
                      color: tokens.colors.textPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'With Gradient',
            builder: (context) {
              final tokens = context.themeTokens;
              return Center(
                child: SealContainer(
                  gradient: tokens.gradients.surfaceGradient,
                  showBorder: true,
                  child: Text(
                    'Gradient surface container',
                    style: tokens.typography.body.copyWith(
                      color: tokens.colors.textPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

// ── Spacing ──────────────────────────────────────────────────────────────────

WidgetbookFolder _buildSpacingFolder() {
  return WidgetbookFolder(
    name: 'Spacing',
    children: [
      WidgetbookComponent(
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
      ),
    ],
  );
}
