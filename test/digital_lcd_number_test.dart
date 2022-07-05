import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:digital_lcd_number/digital_lcd_number.dart';

void main() {
  testWidgets('digital lcd number widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DigitalLcdNumber(
          number: 1,
        ),
      ),
    ));
    expect(find.byType(DigitalLcdNumber), findsOneWidget);
  });
}
