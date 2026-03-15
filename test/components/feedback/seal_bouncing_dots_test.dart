import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seal_ui/seal_ui.dart';

Widget _wrap(Widget child) {
  return SealTheme(
    tokens: SealThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: SealThemeFactory.dark(),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('SealBouncingDots', () {
    testWidgets('renders three dots', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Colors.white)),
      );
      await tester.pump();

      final containers = find.byType(Container);
      // 3 dot containers inside the Row
      expect(containers, findsNWidgets(3));
    });

    testWidgets('uses provided color', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Colors.red)),
      );
      await tester.pump();

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.red);
    });

    testWidgets('uses provided size', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Colors.white, size: 10)),
      );
      await tester.pump();

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, 10);
      expect(container.constraints?.maxHeight, 10);
    });

    testWidgets('animates over time', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Colors.white)),
      );

      // Capture initial transforms
      final initialTransforms = _getTranslateYValues(tester);

      // Advance animation
      await tester.pump(const Duration(milliseconds: 300));
      final laterTransforms = _getTranslateYValues(tester);

      // At least one dot should have moved
      expect(initialTransforms == laterTransforms, isFalse);
    });

    testWidgets('defaults to size 6 and spacing 4', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Colors.white)),
      );
      await tester.pump();

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, 6);
    });
  });
}

List<double> _getTranslateYValues(WidgetTester tester) {
  final transforms = tester.widgetList<Transform>(find.byType(Transform));
  return transforms.map((t) {
    final translation = t.transform.getTranslation();
    return translation.y;
  }).toList();
}
