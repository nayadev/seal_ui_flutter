import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Primary', type: SealTextButton, path: '[Components]/Buttons')
Widget buildSealTextButtonPrimary(BuildContext context) {
  return SealTextButton.primary(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Learn more'),
    ),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Accent', type: SealTextButton, path: '[Components]/Buttons')
Widget buildSealTextButtonAccent(BuildContext context) {
  return SealTextButton.accent(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Details')),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Secondary',
  type: SealTextButton,
  path: '[Components]/Buttons',
)
Widget buildSealTextButtonAccentSecondary(BuildContext context) {
  return SealTextButton.accentSecondary(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Info')),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Gradient', type: SealTextButton, path: '[Components]/Buttons')
Widget buildSealTextButtonGradient(BuildContext context) {
  return SealTextButton.gradient(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Discover'),
    ),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Gradient',
  type: SealTextButton,
  path: '[Components]/Buttons',
)
Widget buildSealTextButtonAccentGradient(BuildContext context) {
  return SealTextButton.accentGradient(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Explore')),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'With Icon', type: SealTextButton, path: '[Components]/Buttons')
Widget buildSealTextButtonWithIcon(BuildContext context) {
  return SealTextButton.primary(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Skip')),
    icon: LucideIcons.arrowRight,
    onPressed: () {},
  );
}

@UseCase(name: 'Custom', type: SealTextButton, path: '[Components]/Buttons')
Widget buildSealTextButtonCustom(BuildContext context) {
  return SealTextButton.custom(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Retry')),
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
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}
