import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'seal_theme_controller.dart';
import 'seal_theme_factory.dart';
import 'seal_theme_tokens.dart';

/// An [InheritedNotifier] that makes [SealThemeController] available to the
/// widget tree, enabling runtime theme switching.
///
/// Wrap your app root (or a subtree) with [SealThemeProvider] to allow all
/// descendant components to react to theme changes via `context.themeTokens`.
///
/// ```dart
/// final controller = SealThemeController(
///   initialTokens: NebulaThemeFactory.tokens(),
/// );
///
/// SealThemeProvider(
///   controller: controller,
///   child: ShadApp(home: MyHome()),
/// )
/// ```
class SealThemeProvider extends InheritedNotifier<SealThemeController> {
  /// Creates a [SealThemeProvider] backed by the given [controller].
  const SealThemeProvider({
    super.key,
    required SealThemeController controller,
    required super.child,
  }) : super(notifier: controller);

  /// Returns the nearest [SealThemeController] from the widget tree.
  ///
  /// Throws an assertion error if no [SealThemeProvider] is found in the
  /// ancestor chain. Use [maybeOf] when a provider may not be present.
  static SealThemeController of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<SealThemeProvider>();
    assert(provider != null, 'No SealThemeProvider found in the widget tree.');
    return provider!.notifier!;
  }

  /// Returns the nearest [SealThemeController], or `null` if none is found.
  static SealThemeController? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SealThemeProvider>()?.notifier;

  /// Returns the active [SealThemeTokens] from the nearest [SealThemeProvider],
  /// or `null` if no provider is found.
  static SealThemeTokens? maybeTokensOf(BuildContext context) =>
      maybeOf(context)?.tokens;
}

/// A convenience widget that creates and manages a [SealThemeController]
/// internally, wrapping [child] with [SealThemeProvider].
///
/// Useful when injecting a static token set without manually managing a
/// controller lifecycle — for example, inside Widgetbook's `themeBuilder`.
///
/// When [tokens] changes between widget rebuilds, the internal controller
/// is updated automatically, causing all dependent descendants to rebuild.
///
/// ```dart
/// SealThemeScope(
///   tokens: ArcticThemeFactory.tokens(),
///   child: MyWidget(),
/// )
/// ```
class SealThemeScope extends StatefulWidget {
  /// Creates a [SealThemeScope] with the given [tokens].
  const SealThemeScope({super.key, required this.tokens, required this.child});

  /// The design tokens to inject into the widget tree.
  final SealThemeTokens tokens;

  /// The widget below this scope in the tree.
  final Widget child;

  @override
  State<SealThemeScope> createState() => _SealThemeScopeState();
}

class _SealThemeScopeState extends State<SealThemeScope> {
  late final SealThemeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SealThemeController(initialTokens: widget.tokens);
  }

  @override
  void didUpdateWidget(SealThemeScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tokens != widget.tokens) {
      _controller.setTheme(widget.tokens);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: SealThemeFactory.buildShadTheme(widget.tokens),
      child: ShadToaster(
        child: SealThemeProvider(controller: _controller, child: widget.child),
      ),
    );
  }
}
