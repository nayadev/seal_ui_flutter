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

List<SealResizablePanel> _twoPanels() => [
      const SealResizablePanel(
        id: 'a',
        defaultSize: 0.5,
        child: Text('Panel A'),
      ),
      const SealResizablePanel(
        id: 'b',
        defaultSize: 0.5,
        child: Text('Panel B'),
      ),
    ];

void main() {
  group('SealResizablePanelGroup', () {
    testWidgets('renders horizontal group without error', (tester) async {
      await tester.pumpWidget(
        _wrap(SizedBox(height: 200, child: SealResizablePanelGroup(children: _twoPanels()))),
      );
      await tester.pump();

      expect(find.byType(SealResizablePanelGroup), findsOneWidget);
    });

    testWidgets('renders vertical group without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SizedBox(
            height: 200,
            child: SealResizablePanelGroup(
              axis: Axis.vertical,
              children: _twoPanels(),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealResizablePanelGroup), findsOneWidget);
    });

    testWidgets('renders panel content', (tester) async {
      await tester.pumpWidget(
        _wrap(SizedBox(height: 200, child: SealResizablePanelGroup(children: _twoPanels()))),
      );
      await tester.pump();

      expect(find.text('Panel A'), findsOneWidget);
      expect(find.text('Panel B'), findsOneWidget);
    });

    testWidgets('renders with handle shown', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SizedBox(
            height: 200,
            child: SealResizablePanelGroup(
              showHandle: true,
              children: _twoPanels(),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealResizablePanelGroup), findsOneWidget);
    });

    testWidgets('controller can be provided', (tester) async {
      final controller = SealResizableController();
      await tester.pumpWidget(
        _wrap(
          SizedBox(
            height: 200,
            child: SealResizablePanelGroup(
              controller: controller,
              children: _twoPanels(),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealResizablePanelGroup), findsOneWidget);
      controller.dispose();
    });

    testWidgets('renders three panels', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SizedBox(
            height: 200,
            child: SealResizablePanelGroup(
              children: [
                const SealResizablePanel(
                  id: 'a',
                  defaultSize: 0.33,
                  child: Text('A'),
                ),
                const SealResizablePanel(
                  id: 'b',
                  defaultSize: 0.34,
                  child: Text('B'),
                ),
                const SealResizablePanel(
                  id: 'c',
                  defaultSize: 0.33,
                  child: Text('C'),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });
  });
}
