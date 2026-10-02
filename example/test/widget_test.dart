import 'package:digital_lcd_number/digital_lcd_number.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('example shows the clock with colon and dot',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(DigitalLcdColon), findsOneWidget);
    expect(find.byType(DigitalLcdDot), findsOneWidget);
    // dispose the periodic timer
    await tester.pumpWidget(const SizedBox());
  });
}
