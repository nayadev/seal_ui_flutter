import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealTooltip, path: '[Components]/Interaction')
Widget buildSealTooltipDefault(BuildContext context) {
  return SealTooltip(
    message: Text(
      context.knobs.string(
        label: 'Message',
        initialValue: 'Delete item',
      ),
    ),
    child: SealFilledButton.primary(
      label: const Text('Hover me'),
      onPressed: () {},
    ),
  );
}

@UseCase(name: 'Custom', type: SealTooltip, path: '[Components]/Interaction')
Widget buildSealTooltipCustom(BuildContext context) {
  return SealTooltip.custom(
    builder: (ctx) => const Text('Custom tooltip content'),
    child: SealOutlineButton.primary(
      label: const Text('Hover me'),
      onPressed: () {},
    ),
  );
}
