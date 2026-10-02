## 0.2.0
- Add `DigitalLcdColon` and `DigitalLcdDot` for clocks (`12:34`) and decimals (`12.34`)
- Colon/dot can be dimmed with `active` (e.g. blinking colon)
- Update example (clock demo)
- Package now depends only on the widgets layer (no `material.dart`), so it
  works with `package:material_ui`, `package:cupertino_ui` or neither.
  **Behaviour change:** the default color is the ambient text color
  (`DefaultTextStyle`) instead of the theme's `primaryColor`; pass `color`
  to keep the old look.
- Replace deprecated `Color.alpha` / `withAlpha` usage with `Color.a` / `withValues` (Flutter 3.27+)
- Update lints to `flutter_lints` 6, SDK `>=3.6.0`

## 0.1.2
- Add screenshot to pub.dev

## 0.1.1
- Fix number display on lower sizes

## 0.1.0
- Update README
- Update Documentation

## 0.0.1
- Initial Release
