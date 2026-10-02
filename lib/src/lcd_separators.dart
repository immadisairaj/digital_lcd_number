import 'package:flutter/widgets.dart';

import 'lcd_color.dart';

/// Glowing round dot used by [DigitalLcdColon] and [DigitalLcdDot].
class _LcdDotShape extends StatelessWidget {
  const _LcdDotShape({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final glow = size.clamp(1.0, 15.0);
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: color.a / 1.25),
            blurRadius: glow,
            spreadRadius: glow,
          ),
        ],
      ),
    );
  }
}

/// Resolves the digit height the same way as `DigitalLcdNumber`, so separators
/// line up with digits placed in the same row with the same height constraint.
double _resolveHeight(BoxConstraints constraints) {
  var height = constraints.maxHeight;
  if (height == double.infinity) height = 105;
  if (height <= 0) {
    throw Exception('height of the widget must be greater than 0');
  }
  return height;
}

class _LcdSeparator extends StatelessWidget {
  const _LcdSeparator({
    required this.dotCenters,
    required this.color,
    required this.disabledColor,
    required this.active,
  });

  /// vertical centres of the dots, as a fraction (0..1) of the digit height.
  final List<double> dotCenters;
  final Color? color;
  final Color? disabledColor;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? defaultLcdColor(context);
    final Color disabledColor =
        this.disabledColor ?? color.withValues(alpha: color.a / 10);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = _resolveHeight(constraints);
          // same proportions as a digit: bar width = height * 10 / 23 / 10
          final barWidth = height / 23;
          final dot = barWidth * 1.6;
          return SizedBox(
            height: height,
            width: dot,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                for (final c in dotCenters)
                  Positioned(
                    top: height * c - dot / 2,
                    left: 0,
                    child: _LcdDotShape(
                      size: dot,
                      color: active ? color : disabledColor,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// A colon (two dots) styled like [DigitalLcdNumber], for clocks like
/// `12:34`. Place it in a `Row` next to digits that share the same height.
///
/// Set [active] to `false` to dim it, e.g. to blink the colon every second.
///
/// ```dart
/// DigitalLcdColon(color: Colors.red, active: seconds.isEven),
/// ```
class DigitalLcdColon extends StatelessWidget {
  /// creates an LCD colon.
  ///
  /// [color] defaults to the primary color of the theme and [disabledColor]
  /// to [color] with 10% alpha, like `DigitalLcdNumber`.
  const DigitalLcdColon({
    super.key,
    this.color,
    this.disabledColor,
    this.active = true,
  });

  /// the color of the lit dots. (optional)
  final Color? color;

  /// the color of the dots when [active] is false. (optional)
  final Color? disabledColor;

  /// whether the dots are lit.
  final bool active;

  // A digit is 23 units tall (u = bar width): bar 1u, vertical 10u, bar 1u,
  // vertical 10u, bar 1u. The dots sit at the middle of each vertical segment:
  // 1u + 5u = 6u and 12u + 5u = 17u.
  static const List<double> _centers = [6 / 23, 17 / 23];

  @override
  Widget build(BuildContext context) => _LcdSeparator(
        dotCenters: _centers,
        color: color,
        disabledColor: disabledColor,
        active: active,
      );
}

/// A decimal point (one dot at the baseline) styled like [DigitalLcdNumber],
/// for values like `12.34`.
///
/// ```dart
/// DigitalLcdDot(color: Colors.red),
/// ```
class DigitalLcdDot extends StatelessWidget {
  /// creates an LCD decimal point.
  const DigitalLcdDot({
    super.key,
    this.color,
    this.disabledColor,
    this.active = true,
  });

  /// the color of the lit dot. (optional)
  final Color? color;

  /// the color of the dot when [active] is false. (optional)
  final Color? disabledColor;

  /// whether the dot is lit.
  final bool active;

  // centre of the bottom bar: 22u + 0.5u
  static const List<double> _centers = [22.5 / 23];

  @override
  Widget build(BuildContext context) => _LcdSeparator(
        dotCenters: _centers,
        color: color,
        disabledColor: disabledColor,
        active: active,
      );
}
