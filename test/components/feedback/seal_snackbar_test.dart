import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:seal_ui/seal_ui.dart';

/// Wraps [child] in a fully wired [ShadApp] + [SealThemeScope].
///
/// [SealThemeScope] injects [ShadTheme] and [ShadToaster] automatically,
/// which are required for [SealToast.show] and [SealAlert] to render.
Widget _wrap({required Widget Function(BuildContext) builder}) {
  final tokens = NebulaThemeFactory.tokens();
  return ShadApp(
    builder: (context, child) => SealThemeScope(
      tokens: tokens,
      child: child!,
    ),
    home: Builder(builder: builder),
  );
}

void main() {
  // ── SealAlert ─────────────────────────────────────────────────────────────

  group('SealAlert', () {
    testWidgets('info — renders title and description', (tester) async {
      await tester.pumpWidget(
        _wrap(
          builder: (_) => const SealAlert.info(
            title: 'Heads up!',
            description: 'Something to note.',
          ),
        ),
      );

      expect(find.text('Heads up!'), findsOneWidget);
      expect(find.text('Something to note.'), findsOneWidget);
    });

    testWidgets('success — renders title and description', (tester) async {
      await tester.pumpWidget(
        _wrap(
          builder: (_) => const SealAlert.success(
            title: 'Saved',
            description: 'Changes have been saved.',
          ),
        ),
      );

      expect(find.text('Saved'), findsOneWidget);
      expect(find.text('Changes have been saved.'), findsOneWidget);
    });

    testWidgets('warning — renders title and description', (tester) async {
      await tester.pumpWidget(
        _wrap(
          builder: (_) => const SealAlert.warning(
            title: 'Low storage',
            description: 'Less than 1 GB remaining.',
          ),
        ),
      );

      expect(find.text('Low storage'), findsOneWidget);
      expect(find.text('Less than 1 GB remaining.'), findsOneWidget);
    });

    testWidgets('error — renders title and description', (tester) async {
      await tester.pumpWidget(
        _wrap(
          builder: (_) => const SealAlert.error(
            title: 'Upload failed',
            description: 'Please try again.',
          ),
        ),
      );

      expect(find.text('Upload failed'), findsOneWidget);
      expect(find.text('Please try again.'), findsOneWidget);
    });

    testWidgets('renders without title when title is null', (tester) async {
      await tester.pumpWidget(
        _wrap(
          builder: (_) => const SealAlert.info(description: 'No title here.'),
        ),
      );

      expect(find.text('No title here.'), findsOneWidget);
    });
  });

  // ── SealToast ─────────────────────────────────────────────────────────────

  group('SealToast', () {
    testWidgets('info — shows message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.info(message: 'Info message').show(ctx);
      await tester.pump();

      expect(find.text('Info message'), findsOneWidget);
    });

    testWidgets('success — shows message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.success(message: 'Saved!').show(ctx);
      await tester.pump();

      expect(find.text('Saved!'), findsOneWidget);
    });

    testWidgets('warning — shows message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.warning(message: 'Be careful').show(ctx);
      await tester.pump();

      expect(find.text('Be careful'), findsOneWidget);
    });

    testWidgets('error — shows message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.error(message: 'Something went wrong').show(ctx);
      await tester.pump();

      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets('renders title when provided', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.success(
        message: 'Changes saved.',
        title: 'Success',
      ).show(ctx);
      await tester.pump();

      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Changes saved.'), findsOneWidget);
    });

    testWidgets('renders action button when actionLabel and onAction are set', (
      tester,
    ) async {
      late BuildContext ctx;
      var actionTapped = false;

      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.error(
        message: 'Upload failed.',
        actionLabel: 'Retry',
        onAction: () => actionTapped = true,
      ).show(ctx);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Retry'), findsOneWidget);
      await tester.tap(find.text('Retry'));
      expect(actionTapped, isTrue);
    });

    testWidgets('does not render action button when actionLabel is null', (
      tester,
    ) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.info(message: 'No action', onAction: () {}).show(ctx);
      await tester.pump();

      expect(find.text('Retry'), findsNothing);
    });

    testWidgets('does not render action button when onAction is null', (
      tester,
    ) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.info(
        message: 'No action',
        actionLabel: 'Dismiss',
      ).show(ctx);
      await tester.pump();

      // ShadToast renders the action only when both label and callback exist.
      expect(find.text('Dismiss'), findsNothing);
    });

    testWidgets('toast is rendered via ShadToaster overlay, not SnackBar', (
      tester,
    ) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      SealToast.info(message: 'Overlay toast').show(ctx);
      await tester.pump();

      expect(find.text('Overlay toast'), findsOneWidget);
    });
  });
}
