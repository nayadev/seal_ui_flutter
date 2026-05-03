import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealLoaderComponent extends WidgetbookComponent {
  SealLoaderComponent()
    : super(
        name: 'SealLoader',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final size = context.knobs.object.dropdown<SealLoaderSize>(
                label: 'Size',
                options: SealLoaderSize.values,
                initialOption: SealLoaderSize.medium,
                labelBuilder: (s) => s.name,
              );
              final showLabel = context.knobs.boolean(
                label: 'Show Label',
                initialValue: false,
              );
              return SealLoader(
                size: size,
                label: showLabel ? 'Loading…' : null,
              );
            },
          ),
        ],
      );
}
