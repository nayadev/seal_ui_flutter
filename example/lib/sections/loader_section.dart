import 'package:flutter/material.dart';
import 'package:nebula_ui/nebula_ui.dart';

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
            NebulaLoader(size: NebulaLoaderSize.small),
            NebulaLoader(size: NebulaLoaderSize.medium),
            NebulaLoader(size: NebulaLoaderSize.large),
            NebulaLoader(size: NebulaLoaderSize.medium, label: 'Loading…'),
          ],
        ),
      ],
    );
  }
}
