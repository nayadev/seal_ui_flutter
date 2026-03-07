import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nebula_ui/nebula_ui.dart';

Widget _wrap(Widget child) {
  return NebulaTheme(
    tokens: NebulaThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: NebulaThemeFactory.dark(),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

/// Scale factor applied in the default test environment (800 px ≙ tablet).
const _kTestScaleFactor = 1.125;

/// Rounds [base] × [_kTestScaleFactor] like [NebulaDimension] does.
double _scaled(double base) => (base * _kTestScaleFactor).roundToDouble();

void main() {
  group('NebulaLoader', () {
    testWidgets('renders a CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaLoader()));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('defaults to medium size (24x24)', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaLoader()));
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, _scaled(24));
      expect(sizedBox.height, _scaled(24));
    });

    testWidgets('renders small size (16x16)', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaLoader(size: NebulaLoaderSize.small)),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, _scaled(16));
      expect(sizedBox.height, _scaled(16));
    });

    testWidgets('renders large size (40x40)', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaLoader(size: NebulaLoaderSize.large)),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, _scaled(40));
      expect(sizedBox.height, _scaled(40));
    });

    testWidgets('uses custom color when provided', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaLoader(color: Colors.red)));
      await tester.pump();

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(indicator.color, Colors.red);
    });

    testWidgets('uses custom strokeWidth when provided', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaLoader(strokeWidth: 5.0)));
      await tester.pump();

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(indicator.strokeWidth, _scaled(5.0));
    });

    testWidgets('shows label text below spinner', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaLoader(label: 'Loading...')));
      await tester.pump();

      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('does not show Column when label is null', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaLoader()));
      await tester.pump();

      // Without a label, the loader returns just a SizedBox, no Column.
      expect(find.byType(Column), findsNothing);
    });
  });
}
