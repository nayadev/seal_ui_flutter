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
  group('SealPopoverController', () {
    test('starts closed by default', () {
      final controller = SealPopoverController();
      expect(controller.isOpen, false);
    });

    test('starts open when isOpen: true', () {
      final controller = SealPopoverController(isOpen: true);
      expect(controller.isOpen, true);
    });

    test('show() opens the controller', () {
      final controller = SealPopoverController();
      controller.show();
      expect(controller.isOpen, true);
    });

    test('hide() closes the controller', () {
      final controller = SealPopoverController(isOpen: true);
      controller.hide();
      expect(controller.isOpen, false);
    });

    test('toggle() flips state', () {
      final controller = SealPopoverController();
      controller.toggle();
      expect(controller.isOpen, true);
      controller.toggle();
      expect(controller.isOpen, false);
    });
  });

  group('SealPopover', () {
    testWidgets('renders child widget', (tester) async {
      final controller = SealPopoverController();
      await tester.pumpWidget(
        _wrap(
          SealPopover(
            controller: controller,
            popover: (_) => const Text('Popover content'),
            child: const Text('Trigger'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Trigger'), findsOneWidget);
    });

    testWidgets('popover is hidden when visible: false', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealPopover(
            visible: false,
            popover: (_) => const Text('Popover content'),
            child: const Text('Trigger'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Popover content'), findsNothing);
    });

    testWidgets('popover is shown when visible: true', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealPopover(
            visible: true,
            popover: (_) => const Text('Popover content'),
            child: const Text('Trigger'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Popover content'), findsOneWidget);
    });

    testWidgets('popover shows on button tap via controller toggle',
        (tester) async {
      final controller = SealPopoverController();
      await tester.pumpWidget(
        _wrap(
          SealPopover(
            controller: controller,
            popover: (_) => const Text('Popover content'),
            child: GestureDetector(
              onTap: controller.toggle,
              child: const Text('Trigger'),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Popover content'), findsNothing);

      await tester.tap(find.text('Trigger'));
      await tester.pumpAndSettle();

      expect(find.text('Popover content'), findsOneWidget);
    });

    testWidgets('popover renders rich content', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealPopover(
            visible: true,
            popover: (_) => const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Title'),
                Text('Body text'),
              ],
            ),
            child: const Text('Trigger'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Body text'), findsOneWidget);
    });
  });
}
