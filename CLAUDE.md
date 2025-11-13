# CLAUDE.md - Project Context for ojo

## Project Overview

**ojo: your eyes deserve a break** is a cross-platform mobile application built with Flutter that helps computer users practice the 20-20-20 rule to reduce eye strain and promote eye health.

### The 20-20-20 Rule
- Every **20 minutes** of screen time
- Take a **20 second** break
- Look at something **20 feet** (6 meters) away

## Tech Stack

### Framework
- **Flutter** (SDK ^3.6.1)
- **Dart** language
- Material Design 3

### Platform Support
- Android (minSDK 21, targetSDK 34)
- iOS
- Web
- Windows
- macOS

### Key Dependencies
- **provider** (^6.1.2) - State management using ChangeNotifier pattern
- **flex_color_scheme** (^8.1.1) - Advanced theming system
- **rive** (^0.13.20) - Vector animations (eye blink)
- **audioplayers** (^5.2.1) - Cross-platform audio playback
- **url_launcher** (^6.2.5) - Play Store links
- **flutter_localizations** & **intl** (^0.19.0) - Multi-language support

## Project Structure

```
lib/
├── main.dart                  # App entry point, MaterialApp setup
├── flex_theme.dart            # Flex Color Scheme theme configuration
├── providers/
│   └── timer_provider.dart    # State management (ChangeNotifier)
├── screens/
│   ├── start_screen.dart      # Welcome/home screen with eye animation
│   ├── timer_screen.dart      # Main timer display & interaction
│   └── settings_screen.dart   # Settings & Play Store link
└── l10n/
    ├── app_en.arb             # English translations
    └── app_es.arb             # Spanish translations

assets/
├── alarm.mp3                  # Timer completion sound
├── eyeBlink.riv              # Rive animation (eye blink)
└── icon.png                  # App icon
```

## Architecture & State Management

### State Management Pattern
- Uses **Provider** with **ChangeNotifier** pattern
- Single `TimerProvider` class manages all timer state
- Consumer widgets reactively update based on state changes

### Timer State Machine
```
work (20 min) → workComplete (alarm) → rest (20 sec) → ready (alarm) → work
```

**States:**
- `work` - 20-minute work period (dark theme)
- `workComplete` - Work timer finished, prompting rest
- `rest` - 20-second rest period (light theme)
- `ready` - Rest complete, ready to work again

### Theme System
- **Flex Color Scheme** with Indigo M3 color scheme
- Dynamic theme switching based on timer state:
  - Primary Container (light) during work period
  - Secondary Container (light) during rest period
- System-aware dark theme support
- Visual density: Comfortable on all platforms

## Key Features

1. **Dual Timer System**
   - 20-minute work timer
   - 20-second rest timer
   - Countdown display in minutes/seconds

2. **Audio Alerts**
   - Plays alarm sound when timers complete
   - Clean audio resource management

3. **Animated UI**
   - Eye blinking animation on start screen (Rive)
   - Dynamic theme transitions
   - Smooth state changes

4. **Multi-Language Support**
   - English (en)
   - Spanish (es)
   - Smart distance formatting (metric/imperial)

5. **First-Time User Experience**
   - Welcome modal explaining 20-20-20 rule
   - Dismissible onboarding
   - Persistent user preference storage

6. **Settings Screen**
   - Link to Play Store for feedback/ratings
   - App version information

## Development Guidelines

### Running the App
```bash
# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Run for specific platform
flutter run -d android
flutter run -d ios
flutter run -d chrome
```

### Building for Release
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

### Code Style
- Follows Flutter/Dart linting rules (see `analysis_options.yaml`)
- Uses `flutter_lints` package
- Material Design 3 components
- Semantic widget naming

### Testing
```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

## Localization

### Adding/Updating Translations
1. Edit `.arb` files in `lib/l10n/`
2. Run code generation:
   ```bash
   flutter pub run intl_translation:extract_to_arb
   ```
3. Generated localization code appears in `.dart_tool/flutter_gen/`

### Supported Locales
- English (`en`)
- Spanish (`es`)

## Assets

### Audio
- `alarm.mp3` - Timer completion sound (44.1kHz stereo)

### Animations
- `eyeBlink.riv` - Rive eye blinking animation for start screen

### Icons
- App icon configuration in `flutter_launcher_icons.yaml`
- Auto-generates icons for Android and iOS

## Version Information
- **Current Version:** 1.0.2 (build 4)
- **Package:** solutions.bluestem.ojo202020

## Common Tasks

### Update App Icon
```bash
flutter pub run flutter_launcher_icons
```

### Analyze Code
```bash
flutter analyze
```

### Format Code
```bash
flutter format .
```

### Clean Build
```bash
flutter clean
flutter pub get
```

## Platform-Specific Notes

### Android
- Package: `solutions.bluestem.ojo202020`
- Min SDK: 21 (Android 5.0)
- Target SDK: 34 (Android 14)
- Uses Material 3 adaptive icons

### iOS
- Bundle ID: Not specified in config
- Deployment target: iOS 12.0+
- CocoaPods integration

### Web
- PWA-ready with manifest.json
- Responsive design
- Browser audio playback support

## Key Files to Know

- `lib/providers/timer_provider.dart` - Core timer logic and state
- `lib/screens/timer_screen.dart` - Main UI and user interaction
- `lib/flex_theme.dart` - Theme definitions and color schemes
- `pubspec.yaml` - Dependencies and asset management
- `lib/l10n/*.arb` - Translation strings

## Tips for Claude

1. **Timer Logic**: All timer state is managed in `TimerProvider`. Don't duplicate timer logic elsewhere.

2. **State Updates**: Always use `notifyListeners()` after state changes in the provider.

3. **Theme Switching**: Themes are built dynamically based on `TimerProvider.timerState`. Don't hardcode themes.

4. **Audio Playback**: AudioPlayer instances must be properly disposed to prevent memory leaks.

5. **Localization**: Use `AppLocalizations.of(context)` to access translated strings, never hardcode user-facing text.

6. **Platform Detection**: Use `Theme.of(context).platform` for platform-specific behavior.

## Testing Strategy

- Widget tests for UI components
- Provider tests for state management logic
- Integration tests for timer flow
- Manual testing on multiple platforms

## Future Enhancement Ideas

- Customizable timer durations
- Notification support
- Statistics/streak tracking
- Different alarm sounds
- Accessibility improvements (TalkBack/VoiceOver)
- Widget support (Android/iOS home screen widgets)
- Background timer support
