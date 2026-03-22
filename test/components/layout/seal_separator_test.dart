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

void main() {
  group('SealSeparator (horizontal)', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(_wrap(const SealSeparator()));
      await tester.pump();

      expect(find.byType(SealSeparator), findsOneWidget);
    });

    testWidgets('renders with custom margin', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealSeparator(margin: EdgeInsets.symmetric(vertical: 16)),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSeparator), findsOneWidget);
    });

    testWidgets('wraps ShadSeparator', (tester) async {
      await tester.pumpWidget(_wrap(const SealSeparator()));
      await tester.pump();

      expect(find.byType(ShadSeparator), findsOneWidget);
    });
  });

  group('SealSeparator.vertical', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            height: 64,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [SealSeparator.vertical()],
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSeparator), findsOneWidget);
    });

    testWidgets('wraps ShadSeparator', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            height: 64,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [SealSeparator.vertical()],
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadSeparator), findsOneWidget);
    });

    testWidgets('renders with custom margin', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            height: 64,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SealSeparator.vertical(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSeparator), findsOneWidget);
    });
  });
}
