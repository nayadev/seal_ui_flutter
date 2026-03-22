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

const _options = [
  SealSelectOption(value: 'nebula', label: 'Nebula'),
  SealSelectOption(value: 'arctic', label: 'Arctic'),
  SealSelectOption(value: 'ocean', label: 'Deep Ocean'),
];

void main() {
  group('SealSelect', () {
    testWidgets('renders with placeholder when no value', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSelect<String>(
            placeholder: 'Choose a theme',
            options: _options,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Choose a theme'), findsOneWidget);
    });

    testWidgets('renders with label above the control', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSelect<String>(
            label: 'Theme',
            placeholder: 'Pick one',
            options: _options,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Theme'), findsOneWidget);
    });

    testWidgets('renders selected option label in trigger', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSelect<String>(
            value: 'arctic',
            options: _options,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Arctic'), findsOneWidget);
    });

    testWidgets('shows options when tapped', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSelect<String>(
            placeholder: 'Pick one',
            options: _options,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(SealSelect<String>));
      await tester.pumpAndSettle();

      expect(find.text('Nebula'), findsOneWidget);
      expect(find.text('Arctic'), findsOneWidget);
      expect(find.text('Deep Ocean'), findsOneWidget);
    });

    testWidgets('does not open when disabled', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSelect<String>(
            placeholder: 'Pick one',
            enabled: false,
            options: _options,
            onChanged: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSelect<String>), findsOneWidget);
    });
  });
}
