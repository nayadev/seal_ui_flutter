import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealContainer, path: '[Layout]/Containers')
Widget buildSealContainerDefault(BuildContext context) {
  final tokens = context.themeTokens;
  return Center(
    child: SealContainer(
      showBorder: context.knobs.boolean(
        label: 'Show Border',
        initialValue: true,
      ),
      child: Text(
        'Seal UI Container',
        style: tokens.typography.body.copyWith(color: tokens.colors.textPrimary),
      ),
    ),
  );
}

@UseCase(name: 'With Gradient', type: SealContainer, path: '[Layout]/Containers')
Widget buildSealContainerWithGradient(BuildContext context) {
  final tokens = context.themeTokens;
  return Center(
    child: SealContainer(
      gradient: tokens.gradients.surfaceGradient,
      showBorder: true,
      child: Text(
        'Gradient surface container',
        style: tokens.typography.body.copyWith(color: tokens.colors.textPrimary),
      ),
    ),
  );
}
