import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_documentation_addon/widgetbook_documentation_addon.dart';

/// A [DocumentationAddon] that correctly resolves the active component path
/// from [WidgetbookState] instead of [Uri.base].
///
/// The upstream addon reads `Uri.base.queryParameters['path']`, which is always
/// null because widgetbook uses hash-based routing — the path lives in the URL
/// fragment (`#/?path=…`), not in the query string. This subclass solves that
/// by capturing the path directly from [WidgetbookState] (already updated
/// before the build phase runs) and passing it to [loadMarkdown].
class SealDocumentationAddon extends DocumentationAddon {
  SealDocumentationAddon({required super.assetBundle, super.initialBool});

  String? _currentPath;

  @override
  Widget buildUseCase(BuildContext context, Widget child, bool setting) {
    _currentPath = WidgetbookState.of(context).path;
    return super.buildUseCase(context, child, setting);
  }

  /// Loads the markdown file for the currently selected component.
  ///
  /// Reads the path from [_currentPath], which is set from [WidgetbookState]
  /// just before [super.buildUseCase] invokes this method via dynamic dispatch.
  @override
  Future<String> loadMarkdown() async {
    final path = _currentPath;
    if (path == null) return '';
    try {
      return await assetBundle.loadString(
        '${kDebugMode ? '' : 'assets/'}markdown/$path.md',
      );
    } catch (_) {
      return '';
    }
  }
}
