import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealAccordionComponent extends WidgetbookComponent {
  SealAccordionComponent()
    : super(
        name: 'SealAccordion',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealAccordion<String>(
                items: const [
                  SealAccordionItem(
                    value: 'q1',
                    title: Text('What is Seal UI?'),
                    child: Text(
                      'A token-driven Flutter design system built on shadcn_ui.',
                    ),
                  ),
                  SealAccordionItem(
                    value: 'q2',
                    title: Text('How do I install it?'),
                    child: Text(
                      'Add seal_ui to your pubspec.yaml dependencies.',
                    ),
                  ),
                  SealAccordionItem(
                    value: 'q3',
                    title: Text('Does it support dark mode?'),
                    child: Text('Yes — dark mode is the primary experience.'),
                  ),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Multiple',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealAccordion<String>.multiple(
                initialValues: const ['q1'],
                items: const [
                  SealAccordionItem(
                    value: 'q1',
                    title: Text('Typography'),
                    child: Text(
                      'Uses Inter via Google Fonts, scaled per breakpoint.',
                    ),
                  ),
                  SealAccordionItem(
                    value: 'q2',
                    title: Text('Colors'),
                    child: Text(
                      'Each theme defines its own ColorPalette implementation.',
                    ),
                  ),
                  SealAccordionItem(
                    value: 'q3',
                    title: Text('Spacing'),
                    child: Text(
                      'SealDimension provides named spacing tokens (xs → xxxl).',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
