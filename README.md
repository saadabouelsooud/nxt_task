## Flutter Interview Task -  README

This document outlines the task for a Flutter developer interview. The goal is to assess your ability to design, develop, and potentially test a simple mobile application using the Flutter framework.

**Technical Stack:**

* Flutter
* Dart (programming language)

**Task Description:**

Create an app that showcases a reservation while having the functionality to change the color mode from dark to light

**Getting Started:**

1. Clone this repository (if applicable).
2. Set up your development environment with Flutter and Dart. You can find resources and guides on the official Flutter website: https://flutter.dev/.
3. run `flutter pub get`
4. run `dart run build_runner build` for go router generated code

### **State managment:**

The used library is called **Signals**

[signals: ^5.2.0](https://pub.dev/packages/signals)

- 🪡 **Fine grained reactivity**: Based on [Preact Signals](https://preactjs.com/blog/signal-boosting/) and provides a fine grained reactivity system that will automatically track dependencies and free them when no longer needed
- ⛓️ **Lazy evaluation**: Signals are lazy and will only compute values when read. If a signal is not read, it will not be computed
- 🗜️ **Flexible API**: Every app is different and signals can be composed in multiple ways. There are a few rules to follow but the API surface is small
- 🔬 **Surgical Rendering**: Widgets can be rebuilt surgically, only marking dirty the parts of the Widget tree that need to be updated and if mounted
- 💙 **100% Dart Native**: Supports Dart JS (HTML), Shelf Server, CLI (and Native), VM, Flutter (Web, Mobile and Desktop). Signals can be used in any Dart project

**Simple usage syntax**
```dart
import 'package:signals/signals.dart';

final counter = signal(0);

// Read value from signal, logs: 0
print(counter.value);

// Write to a signal
counter.value = 1;
```

---

**Testing**

Simply run
```
flutter test
```