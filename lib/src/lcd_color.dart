import 'package:flutter/widgets.dart';

/// The color used when no `color` is given: the ambient text color.
///
/// This keeps the package independent of any design system (Material,
/// Cupertino, ...); it only depends on the widgets layer.
Color defaultLcdColor(BuildContext context) =>
    DefaultTextStyle.of(context).style.color ?? const Color(0xFF000000);
