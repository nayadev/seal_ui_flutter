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
  group('SealOutlineButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.primary(label: Text('Cancel'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.primary(
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
          const SealOutlineButton.primary(label: Text('Disabled'), onPressed: null),
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
          const SealOutlineButton.primary(
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
          SealOutlineButton.primary(
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

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.primary(label: Text('Test'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });
  });

  group('SealOutlineButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.accent(label: Text('Details'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Details'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accent(
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
        _wrap(const SealOutlineButton.accent(label: Text('Off'), onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.accent(label: Text('A'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });
  });

  group('SealOutlineButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentSecondary(label: Text('Info'), onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Info'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentSecondary(
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
          const SealOutlineButton.accentSecondary(
            label: Text('Off'),
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentSecondary(label: Text('A'), onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadButton), findsOneWidget);
    });
  });

  group('SealOutlineButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.gradient(label: Text('Explore'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Explore'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.gradient(
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
          const SealOutlineButton.gradient(label: Text('Off'), onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.gradient(label: Text('G'), onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(ShadButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.gradient(
            label: Text('Nav'),
            icon: LucideIcons.compass,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.compass), findsOneWidget);
      expect(find.text('Nav'), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const SealOutlineButton.gradient(
            label: Text('Wait'),
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBouncingDots), findsOneWidget);
      expect(find.text('Wait'), findsOneWidget);
    });
  });

  group('SealOutlineButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(label: Text('More'), onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(
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
          const SealOutlineButton.accentGradient(
            label: Text('Off'),
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(label: Text('AG'), onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(ShadButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(
            label: Text('Nav'),
            icon: LucideIcons.star,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.star), findsOneWidget);
      expect(find.text('Nav'), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const SealOutlineButton.accentGradient(
            label: Text('Wait'),
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBouncingDots), findsOneWidget);
      expect(find.text('Wait'), findsOneWidget);
    });
  });
}
