import 'package:digital_lcd_number/digital_lcd_number.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// The test binding gives the root tight constraints, which would override a
/// `SizedBox`; `Align` loosens them so the sizes below apply.
Widget host(Widget child) => Directionality(
      textDirection: TextDirection.ltr,
      child: Align(alignment: Alignment.topLeft, child: child),
    );

void main() {
  testWidgets('digital lcd number widget', (tester) async {
    await tester.pumpWidget(host(const Center(child: DigitalLcdNumber(number: 1))));
    expect(find.byType(DigitalLcdNumber), findsOneWidget);
  });

  testWidgets('every digit builds', (tester) async {
    for (var n = 0; n <= 9; n++) {
      await tester.pumpWidget(host(
        SizedBox(height: 100, width: 60, child: DigitalLcdNumber(number: n)),
      ));
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('colon and dot build inside a row with digits', (tester) async {
    await tester.pumpWidget(host(
      const SizedBox(
        height: 120,
        child: Row(
          children: [
            DigitalLcdNumber(number: 1),
            DigitalLcdColon(color: Color(0xFFFF0000)),
            DigitalLcdNumber(number: 2),
            DigitalLcdDot(color: Color(0xFFFF0000), active: false),
            DigitalLcdNumber(number: 3),
          ],
        ),
      ),
    ));
    expect(find.byType(DigitalLcdColon), findsOneWidget);
    expect(find.byType(DigitalLcdDot), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('separator has the same height as a digit', (tester) async {
    await tester.pumpWidget(host(
      const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120, width: 80, child: DigitalLcdNumber(number: 8)),
          SizedBox(height: 120, child: DigitalLcdColon()),
        ],
      ),
    ));
    expect(tester.getSize(find.byType(DigitalLcdColon)).height, 120);
  });
}
