import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Primary', type: SealIconButton, path: '[Components]/Buttons')
Widget buildSealIconButtonPrimary(BuildContext context) {
  return SealIconButton.primary(
    icon: LucideIcons.x,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Close'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Accent', type: SealIconButton, path: '[Components]/Buttons')
Widget buildSealIconButtonAccent(BuildContext context) {
  return SealIconButton.accent(
    icon: LucideIcons.ellipsisVertical,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'More'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Secondary',
  type: SealIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealIconButtonAccentSecondary(BuildContext context) {
  return SealIconButton.accentSecondary(
    icon: LucideIcons.info,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Info'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Gradient', type: SealIconButton, path: '[Components]/Buttons')
Widget buildSealIconButtonGradient(BuildContext context) {
  return SealIconButton.gradient(
    icon: LucideIcons.slidersHorizontal,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Filter'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Gradient',
  type: SealIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealIconButtonAccentGradient(BuildContext context) {
  return SealIconButton.accentGradient(
    icon: LucideIcons.search,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Search'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Custom', type: SealIconButton, path: '[Components]/Buttons')
Widget buildSealIconButtonCustom(BuildContext context) {
  return SealIconButton.custom(
    icon: LucideIcons.star,
    color: context.knobs.object.dropdown<Color>(
      label: 'Color',
      options: [
        ColorX.red,
        ColorX.teal,
        ColorX.orange,
        ColorX.indigo,
        ColorX.pink,
      ],
      initialOption: ColorX.teal,
      labelBuilder: (v) => v.toString(),
    ),
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Favorite'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}
