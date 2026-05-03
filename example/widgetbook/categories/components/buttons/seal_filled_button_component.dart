import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Primary', type: SealFilledButton, path: '[Components]/Buttons')
Widget buildSealFilledButtonPrimary(BuildContext context) {
  return SealFilledButton.primary(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Get Started'),
    ),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Accent', type: SealFilledButton, path: '[Components]/Buttons')
Widget buildSealFilledButtonAccent(BuildContext context) {
  return SealFilledButton.accent(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Continue'),
    ),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Secondary',
  type: SealFilledButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledButtonAccentSecondary(BuildContext context) {
  return SealFilledButton.accentSecondary(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Confirm'),
    ),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Gradient', type: SealFilledButton, path: '[Components]/Buttons')
Widget buildSealFilledButtonGradient(BuildContext context) {
  return SealFilledButton.gradient(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Launch'),
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
  type: SealFilledButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledButtonAccentGradient(BuildContext context) {
  return SealFilledButton.accentGradient(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Boost'),
    ),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'With Icon',
  type: SealFilledButton,
  path: '[Components]/Buttons',
)
Widget buildSealFilledButtonWithIcon(BuildContext context) {
  return SealFilledButton.gradient(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Explore'),
    ),
    icon: LucideIcons.rocket,
    onPressed: () {},
  );
}

@UseCase(name: 'Custom', type: SealFilledButton, path: '[Components]/Buttons')
Widget buildSealFilledButtonCustom(BuildContext context) {
  return SealFilledButton.custom(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Delete'),
    ),
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
