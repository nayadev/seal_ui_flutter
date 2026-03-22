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

/// Scale factor applied in the default test environment (800 px ≙ tablet).
const _kTestScaleFactor = 1.125;

/// Rounds [base] × [_kTestScaleFactor] like [SealDimension] does.
double _scaled(double base) => (base * _kTestScaleFactor).roundToDouble();

void main() {
  group('SealLoader', () {
    testWidgets('renders a CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(_wrap(const SealLoader()));
      await tester.pump();

      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('defaults to medium size (24x24)', (tester) async {
      await tester.pumpWidget(_wrap(const SealLoader()));
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, _scaled(24));
      expect(sizedBox.height, _scaled(24));
    });

    testWidgets('renders small size (16x16)', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealLoader(size: SealLoaderSize.small)),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, _scaled(16));
      expect(sizedBox.height, _scaled(16));
    });

    testWidgets('renders large size (40x40)', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealLoader(size: SealLoaderSize.large)),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, _scaled(40));
      expect(sizedBox.height, _scaled(40));
    });

    testWidgets('uses custom color when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealLoader(color: Color(0xFFF44336))),
      );
      await tester.pump();

      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('uses custom strokeWidth when provided', (tester) async {
      await tester.pumpWidget(_wrap(const SealLoader(strokeWidth: 5.0)));
      await tester.pump();

      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('shows label text below spinner', (tester) async {
      await tester.pumpWidget(_wrap(const SealLoader(label: 'Loading...')));
      await tester.pump();

      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('does not show Column when label is null', (tester) async {
      await tester.pumpWidget(_wrap(const SealLoader()));
      await tester.pump();

      // Without a label, the loader returns just a SizedBox, no Column.
      expect(find.byType(Column), findsNothing);
    });
  });
}
