# Flutter Workspace

This workspace contains multiple Flutter projects.

## Projects

1. **calculator** - A simple calculator Flutter app
2. **to-do** - A to-do list Flutter app

## How to Run Any Project

### Method 1: VS Code (Recommended)

1. Open any Flutter file (e.g., `main.dart`)
2. Press `F5` or click "Run and Debug"
3. Select the appropriate launch configuration

### Method 2: Terminal

```bash
cd <project-name>
flutter run
```

### Method 3: VS Code Tasks

1. Press `Ctrl+Shift+P`
2. Type "Tasks: Run Task"
3. Select a Flutter task (Run, Clean, Get Packages, etc.)

## ⚠️ Important

**DO NOT** run Flutter projects with `dart` command:

```bash
❌ dart lib/main.dart  # This will FAIL!
✅ flutter run          # This is CORRECT!
```

## Common Commands

```bash
# Run the app
flutter run

# Run on specific device
flutter run -d chrome
flutter run -d edge

# Clean build files
flutter clean

# Get dependencies
flutter pub get

# Build for release
flutter build apk      # Android
flutter build web      # Web
flutter build windows  # Windows
```

## VS Code Shortcuts

- `F5` - Start debugging
- `Ctrl+F5` - Run without debugging
- `Shift+F5` - Stop debugging
- `Ctrl+Shift+B` - Run build task
- `Ctrl+Shift+P` then "Flutter: Hot Reload"

## Requirements

- Flutter SDK installed
- Dart SDK (comes with Flutter)
- VS Code with Dart & Flutter extensions
