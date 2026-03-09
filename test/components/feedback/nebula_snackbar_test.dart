import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nebula_ui/nebula_ui.dart';

/// Wraps [child] in a fully wired [NebulaTheme] + [MaterialApp] + [Scaffold].
///
/// A [Builder] is placed in the body so tests can capture a [BuildContext] that
/// has access to [ScaffoldMessenger].
Widget _wrap({required Widget Function(BuildContext) builder}) {
  return NebulaTheme(
    tokens: NebulaThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: NebulaThemeFactory.dark(),
      home: Builder(builder: (context) => Scaffold(body: builder(context))),
    ),
  );
}

void main() {
  group('NebulaSnackbar', () {
    // ── show() ───────────────────────────────────────────────────────────

    testWidgets('info — renders message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      NebulaSnackbar.info(message: 'Info message').show(ctx);
      await tester.pump();

      expect(find.text('Info message'), findsOneWidget);
      expect(find.byIcon(Icons.info_rounded), findsOneWidget);
    });

    testWidgets('success — renders message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      NebulaSnackbar.success(message: 'Saved!').show(ctx);
      await tester.pump();

      expect(find.text('Saved!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('warning — renders message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      NebulaSnackbar.warning(message: 'Be careful').show(ctx);
      await tester.pump();

      expect(find.text('Be careful'), findsOneWidget);
      expect(find.byIcon(Icons.warning_rounded), findsOneWidget);
    });

    testWidgets('error — renders message', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      NebulaSnackbar.error(message: 'Something went wrong').show(ctx);
      await tester.pump();

      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.byIcon(Icons.error_rounded), findsOneWidget);
    });

    // ── title ────────────────────────────────────────────────────────────

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

      NebulaSnackbar.success(
        message: 'Changes saved.',
        title: 'Success',
      ).show(ctx);
      await tester.pump();

      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Changes saved.'), findsOneWidget);
    });

    testWidgets('does not render title widget when title is null', (
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

      NebulaSnackbar.info(message: 'No title here').show(ctx);
      await tester.pump();

      // Only the message text should be present; no extra text.
      expect(find.text('No title here'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    // ── action ───────────────────────────────────────────────────────────

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

      NebulaSnackbar.error(
        message: 'Upload failed.',
        actionLabel: 'Retry',
        onAction: () => actionTapped = true,
      ).show(ctx);
      await tester.pump();
      // Wait for the snackbar entry animation to finish before tapping.
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

      NebulaSnackbar.info(message: 'No action', onAction: () {}).show(ctx);
      await tester.pump();

      expect(find.byType(TextButton), findsNothing);
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

      NebulaSnackbar.info(
        message: 'No action',
        actionLabel: 'Dismiss',
      ).show(ctx);
      await tester.pump();

      expect(find.byType(TextButton), findsNothing);
    });

    // ── replaces existing snackbar ────────────────────────────────────────

    testWidgets('top — replaces any existing visible top snackbar', (
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

      NebulaSnackbar.info(message: 'First').show(ctx);
      await tester.pump();
      expect(find.text('First'), findsOneWidget);

      NebulaSnackbar.success(message: 'Second').show(ctx);
      await tester.pump();

      expect(find.text('First'), findsNothing);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('bottom — replaces any existing visible bottom snackbar', (
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

      NebulaSnackbar.info(
        message: 'First',
        alignment: NebulaSnackbarAlignment.bottom,
      ).show(ctx);
      await tester.pump();
      expect(find.text('First'), findsOneWidget);

      NebulaSnackbar.success(
        message: 'Second',
        alignment: NebulaSnackbarAlignment.bottom,
      ).show(ctx);
      await tester.pump();

      expect(find.text('First'), findsNothing);
      expect(find.text('Second'), findsOneWidget);
    });

    // ── alignment ─────────────────────────────────────────────────────────

    testWidgets('top alignment — renders via Overlay', (tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        _wrap(
          builder: (context) {
            ctx = context;
            return const SizedBox.shrink();
          },
        ),
      );

      NebulaSnackbar.info(
        message: 'Top snackbar',
        alignment: NebulaSnackbarAlignment.top,
      ).show(ctx);
      await tester.pump();

      expect(find.text('Top snackbar'), findsOneWidget);
      // Top snackbars are rendered via Overlay, not SnackBar.
      expect(find.byType(SnackBar), findsNothing);
    });

    testWidgets('bottom alignment — renders via ScaffoldMessenger', (
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

      NebulaSnackbar.error(
        message: 'Bottom snackbar',
        alignment: NebulaSnackbarAlignment.bottom,
      ).show(ctx);
      await tester.pump();

      expect(find.text('Bottom snackbar'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
