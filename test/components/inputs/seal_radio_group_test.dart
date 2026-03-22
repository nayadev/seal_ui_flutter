import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: Center(child: child),
    ),
  );
}

void main() {
  group('SealRadioGroup', () {
    testWidgets('renders all items', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealRadioGroup<String>(
            value: 'a',
            onChanged: (_) {},
            items: const [
              SealRadioItem(value: 'a', label: Text('Option A')),
              SealRadioItem(value: 'b', label: Text('Option B')),
              SealRadioItem(value: 'c', label: Text('Option C')),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Option A'), findsOneWidget);
      expect(find.text('Option B'), findsOneWidget);
      expect(find.text('Option C'), findsOneWidget);
    });

    testWidgets('calls onChanged when an item is tapped', (tester) async {
      String? received;
      await tester.pumpWidget(
        _wrap(
          SealRadioGroup<String>(
            value: 'a',
            onChanged: (v) => received = v,
            items: const [
              SealRadioItem(value: 'a', label: Text('Option A')),
              SealRadioItem(value: 'b', label: Text('Option B')),
            ],
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Option B'));
      await tester.pump();

      expect(received, isNotNull);
    });

    testWidgets('does not call onChanged when group is disabled', (tester) async {
      bool called = false;
      await tester.pumpWidget(
        _wrap(
          SealRadioGroup<String>(
            value: 'a',
            enabled: false,
            onChanged: (_) => called = true,
            items: const [
              SealRadioItem(value: 'a', label: Text('Option A')),
              SealRadioItem(value: 'b', label: Text('Option B')),
            ],
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Option B'), warnIfMissed: false);
      await tester.pump();

      expect(called, isFalse);
    });

    testWidgets('renders horizontal axis', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealRadioGroup<String>(
            value: 'a',
            onChanged: (_) {},
            axis: Axis.horizontal,
            items: const [
              SealRadioItem(value: 'a', label: Text('A')),
              SealRadioItem(value: 'b', label: Text('B')),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealRadioGroup<String>), findsOneWidget);
    });

    testWidgets('renders without initial value', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealRadioGroup<String>(
            onChanged: (_) {},
            items: const [
              SealRadioItem(value: 'x', label: Text('X')),
              SealRadioItem(value: 'y', label: Text('Y')),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('X'), findsOneWidget);
      expect(find.text('Y'), findsOneWidget);
    });
  });
}
