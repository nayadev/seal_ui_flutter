import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:seal_ui/seal_ui.dart';

/// Builds the **Layout** category for the Widgetbook catalog.
WidgetbookCategory buildLayoutCategory() {
  return WidgetbookCategory(
    name: 'Layout',
    children: [
      _buildAccordionFolder(),
      _buildAvatarsFolder(),
      _buildBadgesFolder(),
      _buildBreadcrumbFolder(),
      _buildCardsFolder(),
      _buildContainersFolder(),
      _buildMenubarFolder(),
      _buildResizableFolder(),
      _buildSeparatorFolder(),
      _buildSpacingFolder(),
      _buildTableFolder(),
      _buildTabsFolder(),
    ],
  );
}

// ── Breadcrumb ────────────────────────────────────────────────────────────────

WidgetbookFolder _buildBreadcrumbFolder() {
  return WidgetbookFolder(
    name: 'Breadcrumb',
    children: [
      WidgetbookComponent(
        name: 'SealBreadcrumb',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealBreadcrumb(
                children: [
                  SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
                  SealBreadcrumbLink(
                    onPressed: () {},
                    child: const Text('Settings'),
                  ),
                  const Text('Profile'),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Dropdown',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealBreadcrumb(
                children: [
                  SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
                  SealBreadcrumbDropdown(
                    items: [
                      SealBreadcrumbDropMenuItem(
                        onPressed: () {},
                        child: Text(context.knobs.string(
                          label: 'Item 1',
                          initialValue: 'Documentation',
                        )),
                      ),
                      SealBreadcrumbDropMenuItem(
                        onPressed: () {},
                        child: Text(context.knobs.string(
                          label: 'Item 2',
                          initialValue: 'Themes',
                        )),
                      ),
                    ],
                    child: const SealBreadcrumbEllipsis(),
                  ),
                  const Text('Components'),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

// ── Accordion ────────────────────────────────────────────────────────────────

WidgetbookFolder _buildAccordionFolder() {
  return WidgetbookFolder(
    name: 'Accordion',
    children: [
      WidgetbookComponent(
        name: 'SealAccordion',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealAccordion<String>(
                items: const [
                  SealAccordionItem(
                    value: 'q1',
                    title: Text('What is Seal UI?'),
                    child: Text('A token-driven Flutter design system built on shadcn_ui.'),
                  ),
                  SealAccordionItem(
                    value: 'q2',
                    title: Text('How do I install it?'),
                    child: Text('Add seal_ui to your pubspec.yaml dependencies.'),
                  ),
                  SealAccordionItem(
                    value: 'q3',
                    title: Text('Does it support dark mode?'),
                    child: Text('Yes — dark mode is the primary experience.'),
                  ),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Multiple',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealAccordion<String>.multiple(
                initialValues: const ['q1'],
                items: const [
                  SealAccordionItem(
                    value: 'q1',
                    title: Text('Typography'),
                    child: Text('Uses Inter via Google Fonts, scaled per breakpoint.'),
                  ),
                  SealAccordionItem(
                    value: 'q2',
                    title: Text('Colors'),
                    child: Text('Each theme defines its own ColorPalette implementation.'),
                  ),
                  SealAccordionItem(
                    value: 'q3',
                    title: Text('Spacing'),
                    child: Text('SealDimension provides named spacing tokens (xs → xxxl).'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

// ── Resizable ────────────────────────────────────────────────────────────────

WidgetbookFolder _buildResizableFolder() {
  return WidgetbookFolder(
    name: 'Resizable',
    children: [
      WidgetbookComponent(
        name: 'SealResizablePanelGroup',
        useCases: [
          WidgetbookUseCase(
            name: 'Horizontal',
            builder: (context) {
              final colors = context.themeTokens.colors;
              final typo = context.themeTokens.typography;
              final dimension = context.dimension;
              return Padding(
                padding: EdgeInsets.all(dimension.lg),
                child: SizedBox(
                  height: 160,
                  child: SealResizablePanelGroup(
                    showHandle: context.knobs.boolean(
                      label: 'Show Handle',
                      initialValue: true,
                    ),
                    children: [
                      SealResizablePanel(
                        id: 'left',
                        defaultSize: 0.5,
                        minSize: 0.2,
                        child: SealContainer(
                          child: Center(
                            child: Text(
                              'Left',
                              style: typo.small.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SealResizablePanel(
                        id: 'right',
                        defaultSize: 0.5,
                        minSize: 0.2,
                        child: SealContainer(
                          child: Center(
                            child: Text(
                              'Right',
                              style: typo.small.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Vertical',
            builder: (context) {
              final colors = context.themeTokens.colors;
              final typo = context.themeTokens.typography;
              final dimension = context.dimension;
              return Padding(
                padding: EdgeInsets.all(dimension.lg),
                child: SizedBox(
                  height: 240,
                  child: SealResizablePanelGroup(
                    axis: Axis.vertical,
                    showHandle: context.knobs.boolean(
                      label: 'Show Handle',
                      initialValue: true,
                    ),
                    children: [
                      SealResizablePanel(
                        id: 'top',
                        defaultSize: 0.5,
                        minSize: 0.2,
                        child: SealContainer(
                          child: Center(
                            child: Text(
                              'Top',
                              style: typo.small.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SealResizablePanel(
                        id: 'bottom',
                        defaultSize: 0.5,
                        minSize: 0.2,
                        child: SealContainer(
                          child: Center(
                            child: Text(
                              'Bottom',
                              style: typo.small.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

// ── Separator ────────────────────────────────────────────────────────────────

WidgetbookFolder _buildSeparatorFolder() {
  return WidgetbookFolder(
    name: 'Separator',
    children: [
      WidgetbookComponent(
        name: 'SealSeparator',
        useCases: [
          WidgetbookUseCase(
            name: 'Horizontal',
            builder: (context) {
              final colors = context.themeTokens.colors;
              final typo = context.themeTokens.typography;
              final dimension = context.dimension;
              return Padding(
                padding: EdgeInsets.all(dimension.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Above', style: typo.small.copyWith(color: colors.textPrimary)),
                    const SealSeparator(),
                    Text('Below', style: typo.small.copyWith(color: colors.textPrimary)),
                  ],
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Vertical',
            builder: (context) {
              final colors = context.themeTokens.colors;
              final typo = context.themeTokens.typography;
              final dimension = context.dimension;
              return Padding(
                padding: EdgeInsets.all(dimension.lg),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Left', style: typo.small.copyWith(color: colors.textPrimary)),
                      const SealSeparator.vertical(),
                      Text('Right', style: typo.small.copyWith(color: colors.textPrimary)),
                    ],
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

// ── Tabs ─────────────────────────────────────────────────────────────────────

WidgetbookFolder _buildTabsFolder() {
  return WidgetbookFolder(
    name: 'Tabs',
    children: [
      WidgetbookComponent(
        name: 'SealTabs',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTabs<String>(
                value: 'account',
                tabs: [
                  SealTab(
                    value: 'account',
                    label: const Text('Account'),
                    content: Padding(
                      padding: EdgeInsets.all(context.dimension.md),
                      child: const Text('Account settings panel.'),
                    ),
                  ),
                  SealTab(
                    value: 'security',
                    label: const Text('Security'),
                    content: Padding(
                      padding: EdgeInsets.all(context.dimension.md),
                      child: const Text('Security settings panel.'),
                    ),
                  ),
                  SealTab(
                    value: 'billing',
                    label: const Text('Billing'),
                    content: Padding(
                      padding: EdgeInsets.all(context.dimension.md),
                      child: const Text('Billing information panel.'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Disabled Tab',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTabs<String>(
                value: 'active',
                tabs: [
                  SealTab(
                    value: 'active',
                    label: const Text('Active'),
                    content: Padding(
                      padding: EdgeInsets.all(context.dimension.md),
                      child: const Text('Active tab content.'),
                    ),
                  ),
                  const SealTab(
                    value: 'disabled',
                    label: Text('Disabled'),
                    content: Text(''),
                    enabled: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}


// ── Menubar ───────────────────────────────────────────────────────────────────

WidgetbookFolder _buildMenubarFolder() {
  return WidgetbookFolder(
    name: 'Menubar',
    children: [
      WidgetbookComponent(
        name: 'SealMenubar',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealMenubar(
                items: [
                  SealMenubarItem(
                    items: [
                      SealContextMenuItem(
                        leading: const Icon(LucideIcons.filePlus, size: 14),
                        child: const Text('New'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        leading: const Icon(LucideIcons.folderOpen, size: 14),
                        child: const Text('Open'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        leading: const Icon(LucideIcons.save, size: 14),
                        child: const Text('Save'),
                        onPressed: () {},
                      ),
                    ],
                    child: const Text('File'),
                  ),
                  SealMenubarItem(
                    items: [
                      SealContextMenuItem(
                        child: const Text('Undo'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        child: const Text('Redo'),
                        onPressed: () {},
                      ),
                    ],
                    child: const Text('Edit'),
                  ),
                  SealMenubarItem(
                    enabled: context.knobs.boolean(
                      label: 'View enabled',
                      initialValue: true,
                    ),
                    items: [
                      SealContextMenuItem(
                        child: const Text('Zoom In'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        child: const Text('Zoom Out'),
                        onPressed: () {},
                      ),
                    ],
                    child: const Text('View'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

// ── Table ─────────────────────────────────────────────────────────────────────

WidgetbookFolder _buildTableFolder() {
  return WidgetbookFolder(
    name: 'Table',
    children: [
      WidgetbookComponent(
        name: 'SealTable',
        useCases: [
          WidgetbookUseCase(
            name: 'List',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SizedBox(
                height: 220,
                child: SealTable.list(
                  header: [
                    SealTableCell.header(child: const Text('Name')),
                    SealTableCell.header(child: const Text('Role')),
                    SealTableCell.header(child: const Text('Status')),
                  ],
                  children: [
                    [
                      SealTableCell(child: const Text('Alice')),
                      SealTableCell(child: const Text('Admin')),
                      SealTableCell(child: const Text('Active')),
                    ],
                    [
                      SealTableCell(child: const Text('Bob')),
                      SealTableCell(child: const Text('Editor')),
                      SealTableCell(child: const Text('Inactive')),
                    ],
                    [
                      SealTableCell(child: const Text('Carol')),
                      SealTableCell(child: const Text('Viewer')),
                      SealTableCell(child: const Text('Active')),
                    ],
                  ],
                ),
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Footer',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SizedBox(
                height: 260,
                child: SealTable.list(
                  header: [
                    SealTableCell.header(child: const Text('Item')),
                    SealTableCell.header(child: const Text('Qty')),
                    SealTableCell.header(child: const Text('Price')),
                  ],
                  children: [
                    [
                      SealTableCell(child: const Text('Widget A')),
                      SealTableCell(child: const Text('2')),
                      SealTableCell(child: const Text('\$10.00')),
                    ],
                    [
                      SealTableCell(child: const Text('Widget B')),
                      SealTableCell(child: const Text('5')),
                      SealTableCell(child: const Text('\$25.00')),
                    ],
                  ],
                  footer: [
                    SealTableCell.footer(child: const Text('Total')),
                    SealTableCell.footer(child: const Text('7')),
                    SealTableCell.footer(child: const Text('\$35.00')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
