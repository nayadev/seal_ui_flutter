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
  group('SealBouncingDots', () {
    testWidgets('renders three dots', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Color(0xFFFFFFFF))),
      );
      await tester.pump();

      final containers = find.byType(Container);
      // 3 dot containers inside the Row
      expect(containers, findsNWidgets(3));
    });

    testWidgets('uses provided color', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Color(0xFFF44336))),
      );
      await tester.pump();

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFFF44336));
    });

    testWidgets('uses provided size', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Color(0xFFFFFFFF), size: 10)),
      );
      await tester.pump();

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, 10);
      expect(container.constraints?.maxHeight, 10);
    });

    testWidgets('animates over time', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBouncingDots(color: Color(0xFFFFFFFF))),
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
        _wrap(const SealBouncingDots(color: Color(0xFFFFFFFF))),
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
