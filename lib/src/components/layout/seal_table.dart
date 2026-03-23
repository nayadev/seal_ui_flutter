import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// Builder function for creating [SealTableCell] widgets.
///
/// Used with [SealTable]'s `builder` constructor.
typedef SealTableCellBuilder =
    SealTableCell Function(BuildContext context, TableVicinity vicinity);

/// A token-styled table cell for use within [SealTable].
///
/// Three variants are available via named constructors:
/// - Default [SealTableCell] — regular data cell.
/// - [SealTableCell.header] — bold header row cell.
/// - [SealTableCell.footer] — muted footer row cell.
///
/// ```dart
/// SealTableCell.header(child: Text('Name'))
/// SealTableCell(child: Text('Alice'))
/// SealTableCell.footer(child: Text('Total'))
/// ```
class SealTableCell extends ShadTableCell {
  /// Creates a regular data cell.
  const SealTableCell({
    super.key,
    required super.child,
    super.alignment,
    super.height,
    super.padding,
    super.style,
  }) : super();

  /// Creates a header cell with muted, semi-bold text.
  const SealTableCell.header({
    super.key,
    required super.child,
    super.alignment,
    super.height,
    super.padding,
    super.style,
  }) : super.header();

  /// Creates a footer cell with muted, semi-bold text.
  const SealTableCell.footer({
    super.key,
    required super.child,
    super.alignment,
    super.height,
    super.padding,
    super.style,
  }) : super.footer();

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final typo = tokens.typography;
    final colors = tokens.colors;
    final dimension = context.dimension;

    final effectiveHeight = height ?? dimension.scaled(kDefaultCellHeight);
    final effectivePadding =
        padding ??
        EdgeInsets.symmetric(horizontal: dimension.scaled(kDefaultCellPaddingH));
    final effectiveAlignment =
        alignment ?? AlignmentDirectional.centerStart;

    final effectiveStyle =
        style ??
        switch (variant) {
          ShadTableCellVariant.cell =>
            typo.body.copyWith(color: colors.textPrimary),
          ShadTableCellVariant.header =>
            typo.small.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ShadTableCellVariant.footer =>
            typo.small.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
        };

    return TableViewCell(
      child: Container(
        height: effectiveHeight,
        alignment: effectiveAlignment,
        padding: effectivePadding,
        child: DefaultTextStyle(style: effectiveStyle, child: child),
      ),
    );
  }
}

/// The default row height for [SealTableCell], in logical pixels.
const double kDefaultCellHeight = 48;

/// The default horizontal padding for [SealTableCell], in logical pixels.
const double kDefaultCellPaddingH = 16;

/// A token-driven data table built on [ShadTable].
///
/// Two constructors are available:
/// - [SealTable] — builder-based, suitable for large datasets.
/// - [SealTable.list] — list-based, suitable for small, static datasets.
///
/// Row hover and border styling automatically use Seal design tokens.
///
/// ## Builder-based (large datasets)
///
/// ```dart
/// SealTable(
///   columnCount: 3,
///   rowCount: 5,
///   header: (context, col) => SealTableCell.header(
///     child: Text(['Name', 'Role', 'Status'][col]),
///   ),
///   builder: (context, vicinity) => SealTableCell(
///     child: Text('Row ${vicinity.row}, Col ${vicinity.column}'),
///   ),
/// )
/// ```
///
/// ## List-based (small datasets)
///
/// ```dart
/// SealTable.list(
///   header: [
///     SealTableCell.header(child: Text('Name')),
///     SealTableCell.header(child: Text('Role')),
///   ],
///   children: [
///     [SealTableCell(child: Text('Alice')), SealTableCell(child: Text('Admin'))],
///     [SealTableCell(child: Text('Bob')),   SealTableCell(child: Text('Editor'))],
///   ],
/// )
/// ```
class SealTable extends StatelessWidget {
  /// Creates a builder-based table for large datasets.
  const SealTable({
    super.key,
    required SealTableCellBuilder this.builder,
    required this.columnCount,
    required this.rowCount,
    this.header,
    this.footer,
    this.columnSpanExtent,
    this.rowSpanExtent,
    this.onRowTap,
    this.onHoveredRowIndex,
    this.verticalScrollController,
    this.horizontalScrollController,
    this.pinnedRowCount,
    this.pinnedColumnCount,
    this.diagonalDragBehavior,
    this.supportedDevices,
  }) : children = null,
       _isListMode = false;

  /// Creates a list-based table for small, static datasets.
  SealTable.list({
    super.key,
    required Iterable<Iterable<SealTableCell>> this.children,
    this.header,
    this.footer,
    this.columnSpanExtent,
    this.rowSpanExtent,
    this.onRowTap,
    this.onHoveredRowIndex,
    this.verticalScrollController,
    this.horizontalScrollController,
    this.pinnedRowCount,
    this.pinnedColumnCount,
    this.diagonalDragBehavior,
    this.supportedDevices,
  }) : builder = null,
       columnCount = children.elementAt(0).length,
       rowCount = children.length,
       _isListMode = true;

  /// Builder for on-demand cell construction. Only used in the default constructor.
  final SealTableCellBuilder? builder;

  /// Explicit 2D list of cells. Only used in [SealTable.list].
  final Iterable<Iterable<SealTableCell>>? children;

  /// Number of data columns.
  final int columnCount;

  /// Number of data rows (excluding header and footer).
  final int rowCount;

  /// Optional header row cells.
  final Iterable<SealTableCell>? header;

  /// Optional footer row cells.
  final Iterable<SealTableCell>? footer;

  /// Optional per-column width extent override.
  final TableSpanExtent? Function(int column)? columnSpanExtent;

  /// Optional per-row height extent override.
  final TableSpanExtent? Function(int row)? rowSpanExtent;

  /// Called when a row is tapped.
  final void Function(int row)? onRowTap;

  /// Called when the hovered row index changes.
  final ValueChanged<int?>? onHoveredRowIndex;

  /// Controller for vertical scrolling.
  final ScrollController? verticalScrollController;

  /// Controller for horizontal scrolling.
  final ScrollController? horizontalScrollController;

  /// Number of pinned rows at the top.
  final int? pinnedRowCount;

  /// Number of pinned columns at the start.
  final int? pinnedColumnCount;

  /// Drag behavior when dragging diagonally.
  final DiagonalDragBehavior? diagonalDragBehavior;

  /// Pointer device kinds that trigger row gestures.
  final Set<PointerDeviceKind>? supportedDevices;

  final bool _isListMode;

  @override
  Widget build(BuildContext context) {
    if (_isListMode) {
      return ShadTable.list(
        header: header?.toList(),
        footer: footer?.toList(),
        columnSpanExtent: columnSpanExtent,
        rowSpanExtent: rowSpanExtent,
        onRowTap: onRowTap,
        onHoveredRowIndex: onHoveredRowIndex,
        verticalScrollController: verticalScrollController,
        horizontalScrollController: horizontalScrollController,
        pinnedRowCount: pinnedRowCount,
        pinnedColumnCount: pinnedColumnCount,
        diagonalDragBehavior: diagonalDragBehavior,
        supportedDevices: supportedDevices,
        children: children!,
      );
    }
    return ShadTable(
      columnCount: columnCount,
      rowCount: rowCount,
      header: header != null ? (ctx, col) => header!.elementAt(col) : null,
      footer: footer != null ? (ctx, col) => footer!.elementAt(col) : null,
      columnSpanExtent: columnSpanExtent,
      rowSpanExtent: rowSpanExtent,
      onRowTap: onRowTap,
      onHoveredRowIndex: onHoveredRowIndex,
      verticalScrollController: verticalScrollController,
      horizontalScrollController: horizontalScrollController,
      pinnedRowCount: pinnedRowCount,
      pinnedColumnCount: pinnedColumnCount,
      diagonalDragBehavior: diagonalDragBehavior,
      supportedDevices: supportedDevices,
      builder: (ctx, vicinity) => builder!(ctx, vicinity),
    );
  }
}
