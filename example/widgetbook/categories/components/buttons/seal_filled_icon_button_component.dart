import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(
  name: 'Primary',
  type: SealFilledIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledIconButtonPrimary(BuildContext context) {
  return SealFilledIconButton.primary(
    icon: LucideIcons.plus,
    tooltip: Text(context.knobs.string(label: 'Tooltip', initialValue: 'Add item')),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent',
  type: SealFilledIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledIconButtonAccent(BuildContext context) {
  return SealFilledIconButton.accent(
    icon: LucideIcons.star,
    tooltip: Text(context.knobs.string(label: 'Tooltip', initialValue: 'Favorite')),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Secondary',
  type: SealFilledIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledIconButtonAccentSecondary(BuildContext context) {
  return SealFilledIconButton.accentSecondary(
    icon: LucideIcons.pencil,
    tooltip: Text(context.knobs.string(label: 'Tooltip', initialValue: 'Edit')),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Gradient',
  type: SealFilledIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledIconButtonGradient(BuildContext context) {
  return SealFilledIconButton.gradient(
    icon: LucideIcons.rocket,
    tooltip: Text(context.knobs.string(label: 'Tooltip', initialValue: 'Launch')),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Gradient',
  type: SealFilledIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledIconButtonAccentGradient(BuildContext context) {
  return SealFilledIconButton.accentGradient(
    icon: LucideIcons.zap,
    tooltip: Text(context.knobs.string(label: 'Tooltip', initialValue: 'Boost')),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Custom',
  type: SealFilledIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledIconButtonCustom(BuildContext context) {
  return SealFilledIconButton.custom(
    icon: LucideIcons.trash2,
    color: context.knobs.object.dropdown<Color>(
      label: 'Color',
      options: [
        ColorX.red,
        ColorX.teal,
        ColorX.orange,
        ColorX.indigo,
        ColorX.pink,
      ],
      initialOption: ColorX.red,
      labelBuilder: (v) => v.toString(),
    ),
    tooltip: Text(context.knobs.string(label: 'Tooltip', initialValue: 'Delete')),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}
