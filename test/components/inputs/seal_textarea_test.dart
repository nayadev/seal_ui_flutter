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
  group('SealTextarea', () {
    testWidgets('renders without label', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextarea()),
      );
      await tester.pump();

      expect(find.byType(SealTextarea), findsOneWidget);
    });

    testWidgets('renders hint text', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextarea(hint: 'Enter a description…')),
      );
      await tester.pump();

      expect(find.text('Enter a description…'), findsOneWidget);
    });

    testWidgets('renders label above the field', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextarea(label: 'Description')),
      );
      await tester.pump();

      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('calls onChanged when text is entered', (tester) async {
      String? received;
      await tester.pumpWidget(
        _wrap(
          SealTextarea(onChanged: (v) => received = v),
        ),
      );
      await tester.pump();

      await tester.enterText(find.byType(SealTextarea), 'Hello');
      await tester.pump();

      expect(received, 'Hello');
    });

    testWidgets('renders in disabled state', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealTextarea(
            enabled: false,
            hint: 'Disabled',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealTextarea), findsOneWidget);
    });
  });
}
