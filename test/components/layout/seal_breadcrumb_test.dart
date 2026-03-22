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
  group('SealBreadcrumb', () {
    testWidgets('renders all children', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumb(
            children: const [
              Text('Home'),
              Text('Settings'),
              Text('Profile'),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('renders a single item without separator', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealBreadcrumb(children: [Text('Home')]),
        ),
      );
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
      expect(find.byType(SealBreadcrumbSeparator), findsNothing);
    });

    testWidgets('renders separators between items', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumb(
            children: const [Text('A'), Text('B'), Text('C')],
          ),
        ),
      );
      await tester.pump();

      // Two separators for three items (A | B | C)
      expect(find.byType(SealBreadcrumbSeparator), findsNWidgets(2));
    });

    testWidgets('custom separator is used when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumb(
            separator: const Text('/'),
            children: const [Text('Home'), Text('Page')],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('/'), findsOneWidget);
      expect(find.byType(SealBreadcrumbSeparator), findsNothing);
    });
  });

  group('SealBreadcrumbLink', () {
    testWidgets('renders child text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumbLink(
            onPressed: () {},
            child: const Text('Home'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumbLink(
            onPressed: () => tapped = true,
            child: const Text('Home'),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Home'));
      expect(tapped, isTrue);
    });
  });

  group('SealBreadcrumbEllipsis', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBreadcrumbEllipsis()),
      );
      await tester.pump();

      expect(find.byType(SealBreadcrumbEllipsis), findsOneWidget);
    });
  });

  group('SealBreadcrumbDropdown', () {
    testWidgets('renders trigger child', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumbDropdown(
            items: const [
              SealBreadcrumbDropMenuItem(child: Text('Item 1')),
            ],
            child: const SealBreadcrumbEllipsis(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBreadcrumbEllipsis), findsOneWidget);
    });

    testWidgets('dropdown items are hidden initially', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumbDropdown(
            items: const [
              SealBreadcrumbDropMenuItem(child: Text('Documentation')),
            ],
            child: const SealBreadcrumbEllipsis(),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Documentation'), findsNothing);
    });

    testWidgets('dropdown opens on tap', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumbDropdown(
            items: const [
              SealBreadcrumbDropMenuItem(child: Text('Documentation')),
            ],
            child: const Text('···'),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('···'));
      await tester.pumpAndSettle();

      expect(find.text('Documentation'), findsOneWidget);
    });
  });

  group('SealBreadcrumbDropMenuItem', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealBreadcrumbDropMenuItem(child: Text('Settings')),
        ),
      );
      await tester.pump();

      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealBreadcrumbDropMenuItem(
            onPressed: () => tapped = true,
            child: const Text('Settings'),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Settings'));
      expect(tapped, isTrue);
    });
  });
}
