## 🧭 Unify Guide – Multi-Tool Productivity App

This is a cross-platform Flutter application that combines essential productivity tools—**Calculator** and **To-Do List**—into a single lightweight app with a clean interface.

### ✨ Features

* 🧮 **Calculator**
  Perform standard calculations with intuitive button layouts and smooth UI.

* ✅ **To-Do Manager**

  * Add tasks with custom priority levels
  * Track progress and update task status
  * Organize tasks efficiently via local storage

* 📊 **Performance Reports**
  Embedded PDF reports and charts visualizing call center data:

  * `Call_Center_Analysis_Report.pdf`
  * `Call_Center_Performance_Analysis.pdf`
  * Charts like `call_volume_by_hour.png`, `call_volume_by_status.png`

### 📁 Project Structure

```
lib/
├── main.dart                # Entry point of the app
└── materials/
    ├── pages/              # Home, calculator, to-do modules
    ├── widgets/            # Shared UI widgets
    ├── constants/          # App-wide constants like colors
    └── classes/            # Local storage and theme handling

assets/
└── images/                 # Icons for UI elements

android/, ios/, windows/    # Platform-specific config for build & release

web/                        # Web app assets for PWA support
```

### 🚀 Getting Started

#### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* Dart 3.x
* IDE (e.g. VS Code or Android Studio)

#### Installation

```bash
git clone https://github.com/hadimn/unify_guide.git
cd unify_guide
flutter pub get
flutter run
```

#### Run on Web

```bash
flutter run -d chrome
```

### 📦 Dependencies

* `provider` – State management
* `shared_preferences` – Local storage for to-dos
* `flutter_svg` – Scalable icons
* `cupertino_icons`, `material_design_icons_flutter` – UI icons

### 📊 Screenshots

You can add screenshots or use the provided PNGs in `assets/images/` to showcase:

* Calculator interface
* To-Do list management
* Call center report summaries

### 📈 Future Enhancements

* Add a calendar integration to the To-Do module
* Export To-Do tasks to PDF
* Cloud sync (Firebase or Supabase)
* Dark/light theme toggle
