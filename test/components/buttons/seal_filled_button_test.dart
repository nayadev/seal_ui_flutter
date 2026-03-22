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
  group('SealFilledButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.primary(label: Text('Submit'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.primary(
            label: Text('Tap Me'),
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap Me'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const SealFilledButton.primary(label: Text('Disabled'), onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Disabled'));
      expect(tapped, isFalse);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const SealFilledButton.primary(
            label: Text('Loading'),
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBouncingDots), findsOneWidget);
      expect(find.text('Loading'), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.primary(
            label: Text('Settings'),
            icon: LucideIcons.settings,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.settings), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('renders ShadButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.primary(label: Text('Test'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });
  });

  group('SealFilledButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.accent(label: Text('Continue'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accent(
            label: Text('Go'),
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(const SealFilledButton.accent(label: Text('Off'), onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('renders ShadButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.accent(label: Text('A'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });
  });

  group('SealFilledButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.gradient(label: Text('Launch'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Launch'), findsOneWidget);
    });

    testWidgets('renders ShadButton', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.gradient(label: Text('Gradient'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.gradient(
            label: Text('Go'),
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('is disabled when isLoading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.gradient(
            label: Text('Wait'),
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadButton));
      expect(tapped, isFalse);
      expect(find.byType(SealBouncingDots), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.gradient(
            label: Text('Explore'),
            icon: LucideIcons.rocket,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.rocket), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
    });
  });

  group('SealFilledButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentSecondary(
            label: Text('Confirm'),
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentSecondary(
            label: Text('Go'),
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const SealFilledButton.accentSecondary(
            label: Text('Off'),
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('renders ShadButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.accentSecondary(label: Text('A'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });
  });

  group('SealFilledButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(label: Text('Boost'), onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Boost'), findsOneWidget);
    });

    testWidgets('renders ShadButton', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(
            label: Text('Accent Grad'),
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(
            label: Text('Go'),
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('is disabled when isLoading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(
            label: Text('Wait'),
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadButton));
      expect(tapped, isFalse);
      expect(find.byType(SealBouncingDots), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(
            label: Text('Spark'),
            icon: LucideIcons.sparkles,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.sparkles), findsOneWidget);
      expect(find.text('Spark'), findsOneWidget);
    });
  });
}
