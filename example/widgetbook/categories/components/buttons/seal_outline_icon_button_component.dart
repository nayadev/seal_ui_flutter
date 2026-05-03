import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(
  name: 'Primary',
  type: SealOutlineIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineIconButtonPrimary(BuildContext context) {
  return SealOutlineIconButton.primary(
    icon: LucideIcons.share2,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Share'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent',
  type: SealOutlineIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineIconButtonAccent(BuildContext context) {
  return SealOutlineIconButton.accent(
    icon: LucideIcons.bookmark,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Save'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Secondary',
  type: SealOutlineIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineIconButtonAccentSecondary(BuildContext context) {
  return SealOutlineIconButton.accentSecondary(
    icon: LucideIcons.slidersHorizontal,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Filter'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Gradient',
  type: SealOutlineIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineIconButtonGradient(BuildContext context) {
  return SealOutlineIconButton.gradient(
    icon: LucideIcons.sparkles,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Magic'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Gradient',
  type: SealOutlineIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineIconButtonAccentGradient(BuildContext context) {
  return SealOutlineIconButton.accentGradient(
    icon: LucideIcons.zap,
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Boost'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Custom',
  type: SealOutlineIconButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineIconButtonCustom(BuildContext context) {
  return SealOutlineIconButton.custom(
    icon: LucideIcons.triangleAlert,
    color: context.knobs.object.dropdown<Color>(
      label: 'Color',
      options: [
        ColorX.red,
        ColorX.teal,
        ColorX.orange,
        ColorX.indigo,
        ColorX.pink,
      ],
      initialOption: ColorX.orange,
      labelBuilder: (v) => v.toString(),
    ),
    tooltip: context.knobs.string(label: 'Tooltip', initialValue: 'Warning'),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}
