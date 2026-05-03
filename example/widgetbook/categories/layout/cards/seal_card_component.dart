import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealCard, path: '[Layout]/Cards')
Widget buildSealCardDefault(BuildContext context) {
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
        context.knobs.string(label: 'Header', initialValue: 'Card Title'),
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
          SizedBox(width: context.dimension.xs),
          SealFilledButton.primary(
            label: const Text('Confirm'),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

@UseCase(name: 'With Gradient', type: SealCard, path: '[Layout]/Cards')
Widget buildSealCardWithGradient(BuildContext context) {
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
}

@UseCase(name: 'Tappable', type: SealCard, path: '[Layout]/Cards')
Widget buildSealCardTappable(BuildContext context) {
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
}
