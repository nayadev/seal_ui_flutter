import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  testWidgets('SealTheme provides tokens to descendants', (
    WidgetTester tester,
  ) async {
    late SealThemeTokens captured;

    await tester.pumpWidget(
      SealTheme(
        tokens: SealThemeFactory.darkTokens(),
        child: ShadApp(
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

    expect(captured.colors, isA<NebulaColorPalette>());
    expect(captured.typography, isA<DefaultTypography>());
    expect(captured.gradients, isA<NebulaGradients>());
  });

  testWidgets('SealTheme falls back to dark tokens without ancestor', (
    WidgetTester tester,
  ) async {
    late SealThemeTokens captured;

    await tester.pumpWidget(
      ShadApp(
        home: Builder(
          builder: (context) {
            captured = context.themeTokens;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pump();

    expect(captured.colors, isA<NebulaColorPalette>());
  });

  test('SealDimension scales values by factor', () {
    const dimension = SealDimension(1.5);
    expect(dimension.md, equals(24.0)); // 16 * 1.5
    expect(dimension.lg, equals(36.0)); // 24 * 1.5
    expect(dimension.xs, equals(12.0)); // 8 * 1.5
  });

  test('SealDimension default factor is 1.0', () {
    const dimension = SealDimension();
    expect(dimension.md, equals(16.0));
    expect(dimension.lg, equals(24.0));
    expect(dimension.sm, equals(12.0));
  });
}
