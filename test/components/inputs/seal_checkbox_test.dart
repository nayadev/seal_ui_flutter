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
  group('SealCheckbox', () {
    testWidgets('renders without label', (tester) async {
      await tester.pumpWidget(_wrap(SealCheckbox(value: false, onChanged: (_) {})));
      await tester.pump();

      expect(find.byType(SealCheckbox), findsOneWidget);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealCheckbox(
            value: false,
            onChanged: (_) {},
            label: const Text('Accept terms'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Accept terms'), findsOneWidget);
    });

    testWidgets('renders with label and sublabel', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealCheckbox(
            value: false,
            onChanged: (_) {},
            label: const Text('Marketing emails'),
            sublabel: const Text('Receive news and updates'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Marketing emails'), findsOneWidget);
      expect(find.text('Receive news and updates'), findsOneWidget);
    });

    testWidgets('calls onChanged when tapped', (tester) async {
      bool? received;
      await tester.pumpWidget(
        _wrap(
          SealCheckbox(
            value: false,
            onChanged: (v) => received = v,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(SealCheckbox));
      await tester.pump();

      expect(received, isNotNull);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      bool called = false;
      await tester.pumpWidget(
        _wrap(
          SealCheckbox(
            value: false,
            enabled: false,
            onChanged: (_) => called = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(SealCheckbox), warnIfMissed: false);
      await tester.pump();

      expect(called, isFalse);
    });

    testWidgets('renders in checked state', (tester) async {
      await tester.pumpWidget(
        _wrap(SealCheckbox(value: true, onChanged: (_) {})),
      );
      await tester.pump();

      expect(find.byType(SealCheckbox), findsOneWidget);
    });
  });
}
