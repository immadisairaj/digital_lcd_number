An automatic sizer digital single-digit number with LCD style widget.

<img width="1004" alt="Screenshot 2022-07-05 at 21 59 40" src="https://user-images.githubusercontent.com/40348358/177374481-a1ad589f-dde3-44f1-828e-8fb2dd23a2ab.png">

## Features

This package (or widget) can be used across any platform as it is platform independent

- Customize the colors of the widget
- Design-system independent: depends only on Flutter's widgets layer (works with `material_ui`, `cupertino_ui` or neither)
- Colon and decimal-point widgets for clocks and decimals

## Setup

There is no special setup required, just add the dependency in `pubspec.yaml`, import the file, and you are good to go..

Add the dependency in `pubspec.yaml`
```yaml
digital_lcd_number: ^0.2.0 # Note: use latest version
```

Import the widget into dart file
```dart
import 'package:digital_lcd_number/digital_lcd_number.dart';
```

## Usage

```dart
// default usage (color defaults to the ambient text color)
DigitalLcdNumber(number: 0),
```

Clock with colon and decimal point (all parts must share the same height):
```dart
SizedBox(
  height: 120,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      DigitalLcdNumber(number: 1, color: Colors.red),
      DigitalLcdNumber(number: 2, color: Colors.red),
      DigitalLcdColon(color: Colors.red), // dim with active: false to blink
      DigitalLcdNumber(number: 3, color: Colors.red),
      DigitalLcdNumber(number: 4, color: Colors.red),
      DigitalLcdDot(color: Colors.red),
      DigitalLcdNumber(number: 5, color: Colors.red),
    ],
  ),
),
```

You can find more usage details in the [`/example`](https://github.com/immadisairaj/digital_lcd_number/tree/main/example).

## Additional information

This package is licensed under [BSD 3-Clause License](https://github.com/immadisairaj/digital_lcd_number/blob/main/LICENSE)
