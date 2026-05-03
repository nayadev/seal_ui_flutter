import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(
  name: 'Horizontal',
  type: SealResizablePanelGroup,
  path: '[Layout]/Resizable',
)
Widget buildSealResizableHorizontal(BuildContext context) {
  final colors = context.themeTokens.colors;
  final typo = context.themeTokens.typography;
  final dimension = context.dimension;
  return Padding(
    padding: EdgeInsets.all(dimension.lg),
    child: SizedBox(
      height: 160,
      child: SealResizablePanelGroup(
        showHandle: context.knobs.boolean(
          label: 'Show Handle',
          initialValue: true,
        ),
        children: [
          SealResizablePanel(
            id: 'left',
            defaultSize: 0.5,
            minSize: 0.2,
            child: SealContainer(
              child: Center(
                child: Text(
                  'Left',
                  style: typo.small.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
          ),
          SealResizablePanel(
            id: 'right',
            defaultSize: 0.5,
            minSize: 0.2,
            child: SealContainer(
              child: Center(
                child: Text(
                  'Right',
                  style: typo.small.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

@UseCase(
  name: 'Vertical',
  type: SealResizablePanelGroup,
  path: '[Layout]/Resizable',
)
Widget buildSealResizableVertical(BuildContext context) {
  final colors = context.themeTokens.colors;
  final typo = context.themeTokens.typography;
  final dimension = context.dimension;
  return Padding(
    padding: EdgeInsets.all(dimension.lg),
    child: SizedBox(
      height: 240,
      child: SealResizablePanelGroup(
        axis: Axis.vertical,
        showHandle: context.knobs.boolean(
          label: 'Show Handle',
          initialValue: true,
        ),
        children: [
          SealResizablePanel(
            id: 'top',
            defaultSize: 0.5,
            minSize: 0.2,
            child: SealContainer(
              child: Center(
                child: Text(
                  'Top',
                  style: typo.small.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
          ),
          SealResizablePanel(
            id: 'bottom',
            defaultSize: 0.5,
            minSize: 0.2,
            child: SealContainer(
              child: Center(
                child: Text(
                  'Bottom',
                  style: typo.small.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
