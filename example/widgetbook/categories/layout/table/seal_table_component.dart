import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealTableComponent extends WidgetbookComponent {
  SealTableComponent()
    : super(
        name: 'SealTable',
        useCases: [
          WidgetbookUseCase(
            name: 'List',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SizedBox(
                height: 220,
                child: SealTable.list(
                  header: [
                    SealTableCell.header(child: const Text('Name')),
                    SealTableCell.header(child: const Text('Role')),
                    SealTableCell.header(child: const Text('Status')),
                  ],
                  children: [
                    [
                      SealTableCell(child: const Text('Alice')),
                      SealTableCell(child: const Text('Admin')),
                      SealTableCell(child: const Text('Active')),
                    ],
                    [
                      SealTableCell(child: const Text('Bob')),
                      SealTableCell(child: const Text('Editor')),
                      SealTableCell(child: const Text('Inactive')),
                    ],
                    [
                      SealTableCell(child: const Text('Carol')),
                      SealTableCell(child: const Text('Viewer')),
                      SealTableCell(child: const Text('Active')),
                    ],
                  ],
                ),
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Footer',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SizedBox(
                height: 260,
                child: SealTable.list(
                  header: [
                    SealTableCell.header(child: const Text('Item')),
                    SealTableCell.header(child: const Text('Qty')),
                    SealTableCell.header(child: const Text('Price')),
                  ],
                  children: [
                    [
                      SealTableCell(child: const Text('Widget A')),
                      SealTableCell(child: const Text('2')),
                      SealTableCell(child: const Text('\$10.00')),
                    ],
                    [
                      SealTableCell(child: const Text('Widget B')),
                      SealTableCell(child: const Text('5')),
                      SealTableCell(child: const Text('\$25.00')),
                    ],
                  ],
                  footer: [
                    SealTableCell.footer(child: const Text('Total')),
                    SealTableCell.footer(child: const Text('7')),
                    SealTableCell.footer(child: const Text('\$35.00')),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
