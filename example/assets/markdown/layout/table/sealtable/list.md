# SealTable — List

Token-styled data table using `SealTable.list` for small, static datasets.

## Usage

```dart
SizedBox(
  height: 220,
  child: SealTable.list(
    header: [
      SealTableCell.header(child: Text('Name')),
      SealTableCell.header(child: Text('Role')),
      SealTableCell.header(child: Text('Status')),
    ],
    children: [
      [
        SealTableCell(child: Text('Alice')),
        SealTableCell(child: Text('Admin')),
        SealTableCell(child: Text('Active')),
      ],
      [
        SealTableCell(child: Text('Bob')),
        SealTableCell(child: Text('Editor')),
        SealTableCell(child: Text('Inactive')),
      ],
    ],
  ),
)
```
