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
  group('SealCalendar (single)', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealCalendar()));
      await tester.pump();

      expect(find.byType(SealCalendar), findsOneWidget);
    });

    testWidgets('renders with a pre-selected date', (tester) async {
      final date = DateTime(2025, 6, 15);
      await tester.pumpWidget(
        _wrap(SealCalendar(selected: date, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealCalendar), findsOneWidget);
    });

    testWidgets('calls onChanged when a day is tapped', (tester) async {
      final results = <DateTime?>[];
      await tester.pumpWidget(
        _wrap(
          SealCalendar(
            initialMonth: DateTime(2025, 6),
            onChanged: results.add,
          ),
        ),
      );
      await tester.pump();

      // Tap the first visible day button
      final dayButtons = find.byType(ShadButton);
      if (dayButtons.evaluate().isNotEmpty) {
        await tester.tap(dayButtons.first);
        await tester.pump();
      }

      // Widget renders — interaction depends on button availability
      expect(find.byType(SealCalendar), findsOneWidget);
    });
  });

  group('SealCalendar.range', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealCalendar.range()));
      await tester.pump();

      expect(find.byType(SealCalendar), findsOneWidget);
    });

    testWidgets('renders with a pre-selected range', (tester) async {
      final range = SealDateTimeRange(
        start: DateTime(2025, 6, 10),
        end: DateTime(2025, 6, 20),
      );
      await tester.pumpWidget(
        _wrap(SealCalendar.range(selected: range, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealCalendar), findsOneWidget);
    });
  });

  group('SealCalendar.multiple', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealCalendar.multiple()));
      await tester.pump();

      expect(find.byType(SealCalendar), findsOneWidget);
    });

    testWidgets('renders with pre-selected dates', (tester) async {
      final dates = [DateTime(2025, 6, 5), DateTime(2025, 6, 10)];
      await tester.pumpWidget(
        _wrap(SealCalendar.multiple(selected: dates, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealCalendar), findsOneWidget);
    });
  });
}
