# SealTable — With Footer

Add a `footer` row to summarise or aggregate table data.

## Usage

```dart
SizedBox(
  height: 260,
  child: SealTable.list(
    header: [
      SealTableCell.header(child: Text('Item')),
      SealTableCell.header(child: Text('Qty')),
      SealTableCell.header(child: Text('Price')),
    ],
    children: [
      [
        SealTableCell(child: Text('Widget A')),
        SealTableCell(child: Text('2')),
        SealTableCell(child: Text('\$10.00')),
      ],
      [
        SealTableCell(child: Text('Widget B')),
        SealTableCell(child: Text('5')),
        SealTableCell(child: Text('\$25.00')),
      ],
    ],
    footer: [
      SealTableCell.footer(child: Text('Total')),
      SealTableCell.footer(child: Text('7')),
      SealTableCell.footer(child: Text('\$35.00')),
    ],
  ),
)
```
