import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases loader size variants and label.
class LoaderSection extends StatelessWidget {
  const LoaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loader', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,
        Row(
          spacing: dimension.lg,
          children: [
            SealLoader(size: SealLoaderSize.small),
            SealLoader(size: SealLoaderSize.medium),
            SealLoader(size: SealLoaderSize.large),
            SealLoader(size: SealLoaderSize.medium, label: 'Loading…'),
          ],
        ),
      ],
    );
  }
}
