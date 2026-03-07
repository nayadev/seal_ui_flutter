import 'package:flutter_test/flutter_test.dart';

import 'package:nebula_ui/main.dart';

void main() {
  testWidgets('Nebula example app renders core sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NebulaExampleApp());
    await tester.pump();

    expect(find.text('Nebula UI'), findsOneWidget);
    expect(find.text('Buttons'), findsOneWidget);
    expect(find.text('Inputs'), findsOneWidget);
    expect(find.text('Container'), findsOneWidget);
    expect(find.text('Loader'), findsOneWidget);
  });
}
