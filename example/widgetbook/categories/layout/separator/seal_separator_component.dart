import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Horizontal', type: SealSeparator, path: '[Layout]/Separator')
Widget buildSealSeparatorHorizontal(BuildContext context) {
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
}

@UseCase(name: 'Vertical', type: SealSeparator, path: '[Layout]/Separator')
Widget buildSealSeparatorVertical(BuildContext context) {
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
}
