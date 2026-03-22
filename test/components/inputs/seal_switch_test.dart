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
  group('SealSwitch', () {
    testWidgets('renders without label', (tester) async {
      await tester.pumpWidget(_wrap(SealSwitch(value: false, onChanged: (_) {})));
      await tester.pump();

      expect(find.byType(SealSwitch), findsOneWidget);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSwitch(
            value: false,
            onChanged: (_) {},
            label: const Text('Enable notifications'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Enable notifications'), findsOneWidget);
    });

    testWidgets('renders with label and sublabel', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSwitch(
            value: false,
            onChanged: (_) {},
            label: const Text('Dark mode'),
            sublabel: const Text('Switch between dark and light themes.'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Dark mode'), findsOneWidget);
      expect(find.text('Switch between dark and light themes.'), findsOneWidget);
    });

    testWidgets('calls onChanged when tapped', (tester) async {
      bool? received;
      await tester.pumpWidget(
        _wrap(SealSwitch(value: false, onChanged: (v) => received = v)),
      );
      await tester.pump();

      await tester.tap(find.byType(SealSwitch));
      await tester.pump();

      expect(received, isNotNull);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      bool called = false;
      await tester.pumpWidget(
        _wrap(
          SealSwitch(
            value: false,
            enabled: false,
            onChanged: (_) => called = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(SealSwitch), warnIfMissed: false);
      await tester.pump();

      expect(called, isFalse);
    });

    testWidgets('renders in on state', (tester) async {
      await tester.pumpWidget(
        _wrap(SealSwitch(value: true, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealSwitch), findsOneWidget);
    });
  });
}
