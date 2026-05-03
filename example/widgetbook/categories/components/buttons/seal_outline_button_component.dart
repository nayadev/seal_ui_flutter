import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Primary', type: SealOutlineButton, path: '[Components]/Buttons')
Widget buildSealOutlineButtonPrimary(BuildContext context) {
  return SealOutlineButton.primary(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Cancel')),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(name: 'Accent', type: SealOutlineButton, path: '[Components]/Buttons')
Widget buildSealOutlineButtonAccent(BuildContext context) {
  return SealOutlineButton.accent(
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
  type: SealOutlineButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineButtonAccentSecondary(BuildContext context) {
  return SealOutlineButton.accentSecondary(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Info')),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Gradient',
  type: SealOutlineButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineButtonGradient(BuildContext context) {
  return SealOutlineButton.gradient(
    label: Text(context.knobs.string(label: 'Label', initialValue: 'Explore')),
    isLoading: context.knobs.boolean(label: 'Loading', initialValue: false),
    onPressed:
        context.knobs.boolean(label: 'Enabled', initialValue: true)
            ? () {}
            : null,
  );
}

@UseCase(
  name: 'Accent Gradient',
  type: SealOutlineButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineButtonAccentGradient(BuildContext context) {
  return SealOutlineButton.accentGradient(
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
  name: 'With Icon',
  type: SealOutlineButton,
  path: '[Components]/Buttons',
)
Widget buildSealOutlineButtonWithIcon(BuildContext context) {
  return SealOutlineButton.primary(
    label: Text(
      context.knobs.string(label: 'Label', initialValue: 'Favorite'),
    ),
    icon: LucideIcons.star,
    onPressed: () {},
  );
}

@UseCase(name: 'Custom', type: SealOutlineButton, path: '[Components]/Buttons')
Widget buildSealOutlineButtonCustom(BuildContext context) {
  return SealOutlineButton.custom(
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
