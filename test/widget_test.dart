import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nebula_ui/nebula_ui.dart';

void main() {
  testWidgets('NebulaTheme provides tokens to descendants', (
    WidgetTester tester,
  ) async {
    late NebulaThemeTokens captured;

    await tester.pumpWidget(
      NebulaTheme(
        tokens: NebulaThemeFactory.darkTokens(),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              captured = context.themeTokens;
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
    await tester.pump();

    expect(captured.colors, isA<DarkColorPalette>());
    expect(captured.typography, isA<DefaultTypography>());
    expect(captured.gradients, isA<DefaultGradients>());
  });

  testWidgets('NebulaTheme falls back to dark tokens without ancestor', (
    WidgetTester tester,
  ) async {
    late NebulaThemeTokens captured;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            captured = context.themeTokens;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pump();

    expect(captured.colors, isA<DarkColorPalette>());
  });

  test('NebulaDimension scales values by factor', () {
    const dimension = NebulaDimension(1.5);
    expect(dimension.md, equals(24.0)); // 16 * 1.5
    expect(dimension.lg, equals(36.0)); // 24 * 1.5
    expect(dimension.xs, equals(12.0)); // 8 * 1.5
  });

  test('NebulaDimension default factor is 1.0', () {
    const dimension = NebulaDimension();
    expect(dimension.md, equals(16.0));
    expect(dimension.lg, equals(24.0));
    expect(dimension.sm, equals(12.0));
  });
}
