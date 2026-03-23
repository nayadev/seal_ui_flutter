import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: SizedBox(width: 600, height: 400, child: child),
    ),
  );
}

void main() {
  group('SealTable', () {
    testWidgets('renders list table without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            children: [
              [
                SealTableCell(child: const Text('Alice')),
                SealTableCell(child: const Text('Admin')),
              ],
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealTable), findsOneWidget);
    });

    testWidgets('renders cell text content', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            children: [
              [
                SealTableCell(child: const Text('Alice')),
                SealTableCell(child: const Text('Admin')),
              ],
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Admin'), findsOneWidget);
    });

    testWidgets('renders header cells', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            header: [
              SealTableCell.header(child: const Text('Name')),
              SealTableCell.header(child: const Text('Role')),
            ],
            children: [
              [
                SealTableCell(child: const Text('Alice')),
                SealTableCell(child: const Text('Admin')),
              ],
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Role'), findsOneWidget);
    });

    testWidgets('renders footer cells', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            children: [
              [
                SealTableCell(child: const Text('Widget A')),
                SealTableCell(child: const Text('\$10.00')),
              ],
            ],
            footer: [
              SealTableCell.footer(child: const Text('Total')),
              SealTableCell.footer(child: const Text('\$10.00')),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Total'), findsOneWidget);
    });

    testWidgets('renders multiple rows', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            children: [
              [SealTableCell(child: const Text('Alice'))],
              [SealTableCell(child: const Text('Bob'))],
              [SealTableCell(child: const Text('Carol'))],
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);
      expect(find.text('Carol'), findsOneWidget);
    });

    testWidgets('wraps ShadTable', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            children: [
              [SealTableCell(child: const Text('Row 1'))],
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTable), findsOneWidget);
    });
  });

  group('SealTableCell', () {
    testWidgets('default cell renders child', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTable.list(
            children: [
              [SealTableCell(child: const Text('data'))],
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('data'), findsOneWidget);
    });

    testWidgets('header cell has header variant', (tester) async {
      final cell = SealTableCell.header(child: const Text('H'));
      expect(cell.variant, ShadTableCellVariant.header);
    });

    testWidgets('footer cell has footer variant', (tester) async {
      final cell = SealTableCell.footer(child: const Text('F'));
      expect(cell.variant, ShadTableCellVariant.footer);
    });
  });
}
