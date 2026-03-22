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
  group('SealSlider', () {
    testWidgets('renders with initial value', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSlider(value: 0.5, onChanged: (_) {}),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSlider), findsOneWidget);
    });

    testWidgets('renders with controller', (tester) async {
      final controller = ShadSliderController(initialValue: 0.3);
      await tester.pumpWidget(
        _wrap(
          SealSlider(controller: controller, onChanged: (_) {}),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSlider), findsOneWidget);
      controller.dispose();
    });

    testWidgets('renders disabled state', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealSlider(value: 0.5, enabled: false),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSlider), findsOneWidget);
    });

    testWidgets('renders with custom min and max', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSlider(
            value: 50,
            min: 0,
            max: 100,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSlider), findsOneWidget);
    });

    testWidgets('throws assertion when both value and controller provided',
        (tester) async {
      final controller = ShadSliderController(initialValue: 0.5);
      expect(
        () => SealSlider(value: 0.5, controller: controller),
        throwsAssertionError,
      );
      controller.dispose();
    });
  });
}
