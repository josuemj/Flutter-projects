# Calculator App

A Flutter calculator application with a dark UI, animated button interactions, and expression evaluation.

## Features

- Basic arithmetic operations (`+`, `-`, `×`, `÷`, `%`)
- Sign toggle (`+/-`)
- Clear (`C`) and delete (`DEL`) actions
- Fade animation for result display
- Press animation for calculator buttons

## Project Structure

```text
calculator_app/
├── lib/
│   ├── main.dart              # App entry point and theme/system UI config
│   ├── calculator.dart        # Calculator screen, logic, and button widget
│   └── model/
│       └── buttons.dart       # Button labels used by the grid
├── test/
│   └── widget_test.dart       # Default Flutter widget test (template)
├── android/                   # Android platform files
├── ios/                       # iOS platform files
├── web/                       # Web platform files
├── linux/                     # Linux desktop platform files
├── macos/                     # macOS desktop platform files
├── windows/                   # Windows desktop platform files
├── pubspec.yaml               # Dependencies and project metadata
└── analysis_options.yaml      # Lint configuration
```

## Dependencies

- `flutter`
- `cupertino_icons`
- `dart_eval`
- `flutter_eval`

## Run the App

```bash
flutter pub get
flutter run
```
