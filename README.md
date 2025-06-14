# 🚀 My Flutter Vogo Project

Welcome to the Flutter iOS project! This repository contains a full-featured Flutter application built specifically to run on iOS devices.

---

## 📦 Features

- Built using Flutter & Dart  
- iOS support (tested on latest Xcode & iPhone simulator)  
- Clean code structure  
- Modular architecture  
- Fast performance  

---

## 🛠️ Requirements

Make sure you have the following installed:

- **Flutter SDK**: [Install Guide](https://docs.flutter.dev/get-started/install)
- **Xcode** (latest version)
- **CocoaPods** (`sudo gem install cocoapods`)
- **Git**

Check if everything is ready:

```bash
flutter doctor
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-flutter-ios-project.git
cd your-flutter-ios-project
```

### 2. Get Flutter Packages

```bash
flutter pub get
```

### 3. iOS Setup

#### a. Install CocoaPods Dependencies

```bash
cd ios
pod install
cd ..
```

#### b. Open iOS Project in Xcode

```bash
open ios/Runner.xcworkspace
```

> ⚠️ Check for correct development team & signing if you're testing on a real device.

---

## 🧪 Running the App

### 🖥️ On iOS Simulator

```bash
flutter run
```

### 📱 On Physical Device

1. Connect your iPhone via USB.  
2. Trust the device and allow permissions.  
3. Set development team in Xcode under:  
   `ios/Runner.xcworkspace → Runner → Signing & Capabilities`  
4. Then run:

```bash
flutter run
```

---

## 🧹 Common Fixes

### ❌ "pod install" Issues

```bash
sudo arch -x86_64 gem install ffi
arch -x86_64 pod install
```

### ❌ iOS Simulator Not Launching

```bash
open -a Simulator
```

---

## 📂 Project Structure

```text
lib/
 ┣ main.dart
 ┣ screens/
 ┣ core/
 |     ┣ network
 |     ┣ auth
 |     ┣ utils
 ┗ data/
 |     ┣ models
 |     ┣ provider 
 |
 ┣ firebase_options.dart
ios/
 ┣ Runner.xcworkspace
 ┗ Podfile
```

---

## 🤝 Contributing

Feel free to fork this repo, raise issues, or submit PRs. Let's build something awesome!

---

## 📄 License

This project is open-sourced under the MIT License.

---

© Vogo
