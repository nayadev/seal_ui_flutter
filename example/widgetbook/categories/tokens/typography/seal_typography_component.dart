import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

/// Marker type for the typography scale widgetbook component.
abstract class TypeScale {}

@UseCase(name: 'All Styles', type: TypeScale, path: '[Tokens]/Typography')
Widget buildTypeScaleAllStyles(BuildContext context) {
  final tokens = context.themeTokens;
  final dimension = context.dimension;
  final typo = tokens.typography;
  final color = tokens.colors.textPrimary;

  return SingleChildScrollView(
    padding: EdgeInsets.all(dimension.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display', style: typo.display.copyWith(color: color)),
        dimension.md.verticalGap,
        Text('Headline', style: typo.headline.copyWith(color: color)),
        dimension.md.verticalGap,
        Text('Title', style: typo.title.copyWith(color: color)),
        dimension.md.verticalGap,
        Text(
          'Subtitle — Subsection headings',
          style: typo.subtitle.copyWith(color: color),
        ),
        dimension.md.verticalGap,
        Text(
          'Body — The quick brown fox jumps over the lazy dog.',
          style: typo.body.copyWith(color: color),
        ),
        dimension.md.verticalGap,
        Text(
          'Small — The quick brown fox jumps over the lazy dog.',
          style: typo.small.copyWith(color: color),
        ),
        dimension.md.verticalGap,
        Text(
          'CAPTION — METADATA & LABELS',
          style: typo.caption.copyWith(color: color),
        ),
      ],
    ),
  );
}
