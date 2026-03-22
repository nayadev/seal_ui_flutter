import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A styled avatar image widget for the Seal UI design system,
/// built on [ShadAvatar].
///
/// Displays a circular profile image loaded from a URL, asset, or other
/// source supported by `UniversalImage`. Falls back to [placeholder] while
/// loading or on error.
///
/// ```dart
/// SealAvatar(
///   src: 'https://example.com/avatar.png',
///   placeholder: Text('JD'),
/// )
///
/// SealAvatar.small(src: 'https://example.com/avatar.png')
/// SealAvatar.large(src: 'https://example.com/avatar.png')
/// ```
class SealAvatar extends StatelessWidget {
  /// Default avatar size in logical pixels.
  static const double _kDefaultSize = 40;

  /// Small avatar size in logical pixels.
  static const double _kSmallSize = 28;

  /// Large avatar size in logical pixels.
  static const double _kLargeSize = 56;

  /// Creates a Seal-styled avatar with an explicit [size].
  const SealAvatar({
    super.key,
    required this.src,
    this.placeholder,
    this.size = _kDefaultSize,
    this.shape = const CircleBorder(),
    this.fit = BoxFit.cover,
  });

  /// Creates a **small** avatar (28 dp before breakpoint scaling).
  const SealAvatar.small({
    Key? key,
    required dynamic src,
    Widget? placeholder,
    BoxFit fit = BoxFit.cover,
  }) : this(
         key: key,
         src: src,
         placeholder: placeholder,
         size: _kSmallSize,
         fit: fit,
       );

  /// Creates a **large** avatar (56 dp before breakpoint scaling).
  const SealAvatar.large({
    Key? key,
    required dynamic src,
    Widget? placeholder,
    BoxFit fit = BoxFit.cover,
  }) : this(
         key: key,
         src: src,
         placeholder: placeholder,
         size: _kLargeSize,
         fit: fit,
       );

  /// The image source — URL, asset path, or any type accepted by
  /// `UniversalImage`.
  // ignore: avoid_annotating_with_dynamic
  final dynamic src;

  /// Widget shown while the image loads or when it fails.
  final Widget? placeholder;

  /// Base size (width and height) before breakpoint scaling.
  final double size;

  /// Shape of the avatar boundary.
  final ShapeBorder shape;

  /// How to inscribe the image into the allocated space.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final scaledSize = context.dimension.scaled(size);

    return ShadAvatar(
      src,
      size: Size.square(scaledSize),
      shape: shape,
      backgroundColor: colors.surfaceAlt,
      placeholder: placeholder,
      fit: fit,
    );
  }
}
