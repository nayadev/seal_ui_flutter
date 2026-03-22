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
  group('SealTimePicker (24h)', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealTimePicker()));
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('renders with initial value', (tester) async {
      const time = SealTimeOfDay(hour: 14, minute: 30, second: 0);
      await tester.pumpWidget(
        _wrap(SealTimePicker(initialValue: time, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('renders in disabled state', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTimePicker(enabled: false)),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('renders without seconds', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTimePicker(showSeconds: false, showMinutes: true, showHours: true)),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('controller can be provided', (tester) async {
      final controller = SealTimePickerController(hour: 9, minute: 0, second: 0);
      await tester.pumpWidget(
        _wrap(SealTimePicker(controller: controller, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
      controller.dispose();
    });
  });

  group('SealTimePicker.period (12h AM/PM)', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealTimePicker.period()));
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('renders with initial AM period', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealTimePicker.period(
            initialDayPeriod: SealDayPeriod.am,
            onChanged: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('renders with initial PM period', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealTimePicker.period(
            initialDayPeriod: SealDayPeriod.pm,
            onChanged: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });

    testWidgets('renders without seconds', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTimePicker.period(showSeconds: false)),
      );
      await tester.pump();

      expect(find.byType(SealTimePicker), findsOneWidget);
    });
  });
}
