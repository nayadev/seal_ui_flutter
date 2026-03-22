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
  group('SealProgress', () {
    testWidgets('renders indeterminate bar when value is null', (tester) async {
      await tester.pumpWidget(_wrap(const SealProgress()));
      await tester.pump();

      expect(find.byType(SealProgress), findsOneWidget);
    });

    testWidgets('renders determinate bar with value', (tester) async {
      await tester.pumpWidget(_wrap(const SealProgress(value: 0.6)));
      await tester.pump();

      expect(find.byType(SealProgress), findsOneWidget);
    });

    testWidgets('renders with accent color', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealProgress(value: 0.4, useAccent: true)),
      );
      await tester.pump();

      expect(find.byType(SealProgress), findsOneWidget);
    });

    testWidgets('renders at full value', (tester) async {
      await tester.pumpWidget(_wrap(const SealProgress(value: 1.0)));
      await tester.pump();

      expect(find.byType(SealProgress), findsOneWidget);
    });

    testWidgets('renders at zero value', (tester) async {
      await tester.pumpWidget(_wrap(const SealProgress(value: 0.0)));
      await tester.pump();

      expect(find.byType(SealProgress), findsOneWidget);
    });
  });
}
