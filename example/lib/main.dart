import 'package:digital_lcd_number/digital_lcd_number.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DigitalLcdDisplayExample(),
    );
  }
}

class DigitalLcdDisplayExample extends StatelessWidget {
  const DigitalLcdDisplayExample({Key? key}) : super(key: key);

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
