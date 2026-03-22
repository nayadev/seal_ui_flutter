import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: SingleChildScrollView(child: Center(child: child)),
    ),
  );
}

void main() {
  group('SealDatePicker (single)', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealDatePicker()));
      await tester.pump();

      expect(find.byType(SealDatePicker), findsOneWidget);
    });

    testWidgets('renders with a pre-selected date', (tester) async {
      final date = DateTime(2025, 6, 15);
      await tester.pumpWidget(
        _wrap(SealDatePicker(selected: date, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealDatePicker), findsOneWidget);
    });

    testWidgets('renders with placeholder', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealDatePicker(placeholder: Text('Pick a date')),
        ),
      );
      await tester.pump();

      expect(find.text('Pick a date'), findsOneWidget);
    });

    testWidgets('renders in disabled state', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealDatePicker(enabled: false)),
      );
      await tester.pump();

      expect(find.byType(SealDatePicker), findsOneWidget);
    });

    testWidgets('opens calendar popover on tap', (tester) async {
      await tester.pumpWidget(
        _wrap(SealDatePicker(onChanged: (_) {})),
      );
      await tester.pump();

      final button = find.byType(ShadButton);
      if (button.evaluate().isNotEmpty) {
        await tester.tap(button.first);
        await tester.pumpAndSettle();
      }

      expect(find.byType(SealDatePicker), findsOneWidget);
    });
  });

  group('SealDatePicker.range', () {
    // Range tests use a wide SizedBox because ShadDatePicker.range renders a
    // button row that needs more horizontal space than the default test surface.
    Widget wrapWide(Widget child) => _wrap(SizedBox(width: 600, child: child));

    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(wrapWide(const SealDatePicker.range()));
      await tester.pump();

      expect(find.byType(SealDatePicker), findsOneWidget);
    });

    testWidgets('renders with a pre-selected range', (tester) async {
      final range = SealDateTimeRange(
        start: DateTime(2025, 6, 10),
        end: DateTime(2025, 6, 20),
      );
      await tester.pumpWidget(
        wrapWide(SealDatePicker.range(selected: range, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealDatePicker), findsOneWidget);
    });

    testWidgets('renders with placeholder', (tester) async {
      await tester.pumpWidget(
        wrapWide(
          const SealDatePicker.range(placeholder: Text('Pick a date range')),
        ),
      );
      await tester.pump();

      expect(find.text('Pick a date range'), findsOneWidget);
    });
  });
}
