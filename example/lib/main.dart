import 'dart:async';

import 'package:digital_lcd_number/digital_lcd_number.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital LCD Number',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const DigitalLcdDisplayExample(),
    );
  }
}

class DigitalLcdDisplayExample extends StatefulWidget {
  const DigitalLcdDisplayExample({super.key});

  @override
  State<DigitalLcdDisplayExample> createState() =>
      _DigitalLcdDisplayExampleState();
}

class _DigitalLcdDisplayExampleState extends State<DigitalLcdDisplayExample> {
  late final Timer _timer;
  final Stopwatch _stopwatch = Stopwatch()..start();
  int _centis = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      setState(() => _centis = _stopwatch.elapsedMilliseconds ~/ 10);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  /// 'MM:SS.cc' as LCD digits with a blinking colon and a decimal point.
  Widget _clock(Color color) {
    final minutes = (_centis ~/ 6000) % 100;
    final seconds = (_centis ~/ 100) % 60;
    final centis = _centis % 100;
    Widget digit(int n) => DigitalLcdNumber(number: n, color: color);
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          digit(minutes ~/ 10),
          digit(minutes % 10),
          DigitalLcdColon(color: color, active: seconds.isEven),
          digit(seconds ~/ 10),
          digit(seconds % 10),
          DigitalLcdDot(color: color),
          digit(centis ~/ 10),
          digit(centis % 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital LCD Display'),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Scroll to view')),
              ),
              // Clock: digits + colon + decimal point
              FittedBox(
                fit: BoxFit.scaleDown,
                child: _clock(Colors.red),
              ),
              // With Sized Box (fixed size)
              const SizedBox(
                height: 200,
                width: 100,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 1,
                  ),
                ),
              ),
              // With row Sized Box (height is fixed and width is infinite)
              const Row(
                children: [
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DigitalLcdNumber(
                        number: 2,
                      ),
                    ),
                  ),
                ],
              ),
              // Without SizedBox (height is infinity and width is fixed)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DigitalLcdNumber(
                  number: 3,
                ),
              ),
              // With row and column (height and width are infinite)
              const Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DigitalLcdNumber(
                          number: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // all above use the same default color
              // below starts the color customization
              //
              // just giving red color
              const SizedBox(
                height: 300,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 5,
                    color: Colors.red,
                  ),
                ),
              ),
              // red color with grey disabled color
              SizedBox(
                height: 300,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 6,
                    color: Colors.red,
                    disabledColor: Colors.grey.shade300,
                  ),
                ),
              ),
              // no color with yellow disabled color
              SizedBox(
                height: 300,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 7,
                    color: Theme.of(context).colorScheme.primary,
                    disabledColor: Colors.yellow.shade200,
                  ),
                ),
              ),
              // green color
              const SizedBox(
                height: 300,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 8,
                    color: Colors.green,
                  ),
                ),
              ),
              // black color with black disabled color
              const SizedBox(
                height: 300,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 9,
                    color: Colors.black,
                    disabledColor: Colors.black12,
                  ),
                ),
              ),
              // yellow color with green disabled color
              SizedBox(
                height: 300,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DigitalLcdNumber(
                    number: 0,
                    color: Colors.yellow.shade600,
                    disabledColor: Colors.green.shade100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
