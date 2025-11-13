# ojo: your eyes deserve a break 👁️

A cross-platform mobile app that helps computer users practice the **20-20-20 rule** to reduce eye strain and promote eye health.

## What is the 20-20-20 Rule?

Eye health experts recommend that for every **20 minutes** of screen time, you should:
- Take a **20 second** break
- Look at something **20 feet** (6 meters) away

While 20-20-20 is easy to remember, it's easy to lose track of time when you're in the flow. **ojo** provides gentle reminders to give your eyes the break they deserve.

## Features

- ⏱️ **Dual Timer System** - 20-minute work periods and 20-second rest breaks
- 🔔 **Audio Alerts** - Gentle alarm sounds when timers complete
- 🎨 **Dynamic Theming** - Visual theme changes between work and rest modes
- 🌍 **Multi-language Support** - Currently supports English and Spanish
- 📱 **Cross-platform** - Built with Flutter for Android, iOS, Web, Windows, and macOS
- ✨ **Smooth Animations** - Eye-catching animations powered by Rive

## Screenshots

![ojo App](assets/Screenshots/screenshot1.png)

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (SDK ^3.6.1)
- Dart SDK (comes with Flutter)
- For Android: Android Studio / Android SDK
- For iOS: Xcode (macOS only)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/bluestemso/ojo_app.git
cd ojo_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Running on Specific Platforms

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows

# macOS
flutter run -d macos
```

## Building for Release

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## How It Works

### User Flow

1. **Start Screen** - User is greeted by an animated eye and a "Start" button
2. **First-Time Users** - A modal explains the 20-20-20 rule (dismissible)
3. **Work Period** - 20-minute timer with dark theme, showing countdown
4. **Work Complete** - Alarm plays, light theme returns, "Start Rest" button appears
5. **Rest Period** - 20-second timer, encouraging you to look away
6. **Ready to Work** - Alarm plays, "Start Work" button ready for next cycle

### Timer States

```
work (20 min) → workComplete → rest (20 sec) → ready → work (repeat)
```

## Tech Stack

### Framework
- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design 3** - Design system

### Key Packages
- **provider** (^6.1.2) - State management
- **flex_color_scheme** (^8.1.1) - Advanced theming
- **rive** (^0.13.20) - Vector animations
- **audioplayers** (^5.2.1) - Audio playback
- **url_launcher** (^6.2.5) - External link support
- **flutter_localizations** - Internationalization

## Project Structure

```
lib/
├── main.dart                  # App entry point
├── flex_theme.dart            # Theme configuration
├── providers/
│   └── timer_provider.dart    # State management
├── screens/
│   ├── start_screen.dart      # Welcome screen
│   ├── timer_screen.dart      # Main timer UI
│   └── settings_screen.dart   # App settings
└── l10n/                      # Localization files
    ├── app_en.arb            # English
    └── app_es.arb            # Spanish
```

## Development

### Code Style

This project follows Flutter's recommended linting rules:

```bash
# Analyze code
flutter analyze

# Format code
flutter format .
```

### Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

### Adding Translations

1. Edit the appropriate `.arb` file in `lib/l10n/`
2. Run the Flutter code generation:
```bash
flutter pub get
```
3. The localization code is auto-generated

## Version

**Current Version:** 1.0.2 (build 4)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is part of Bluestem Solutions.

## Support

Found a bug or have a feature request? Please [open an issue](https://github.com/bluestemso/ojo_app/issues).

Want to rate the app? Find us on the [Google Play Store](https://play.google.com/store/apps/details?id=solutions.bluestem.ojo202020).

## Acknowledgments

- Eye health guidelines based on recommendations from optometry professionals
- Built with ❤️ using Flutter
- Special thanks to the Flutter community for excellent packages

---

**Remember:** Your eyes deserve a break. Take care of them! 👁️✨
