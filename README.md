## 🧭 Unify Guide – All-in-One Productivity Toolkit

**Unify Guide** is a modular, cross-platform Flutter app designed to unify daily utility tools in one elegant interface. From calculations and task management to clocks, notes, and more—this app is built to scale with your productivity needs.

---

### 🚀 Features

Current modules included:

* 🧮 **Calculator** – Basic arithmetic operations with responsive design
* ✅ **To-Do List** – Add, prioritize, and track tasks with persistent local storage

Planned modules:

* 🗓️ Calendar
* ⏰ Clock Suite (Alarm, Stopwatch, Timer, World Clock)
* 📝 Notes
* 📷 QR Scanner
* ☁️ Weather
* 📻 Radio
* 🎙️ Voice Recorder
* 🎵 Music Player

Each module will be independently accessible from the unified home screen.

---

### 🧱 Project Structure

```
lib/
├── main.dart              # Entry point and route management
└── materials/
    ├── pages/             # Feature modules (calculator, todo, etc.)
    ├── constants/         # Global colors, config
    ├── classes/           # Theme provider, local storage
    └── widgets/           # Reusable UI widgets

assets/
└── images/                # UI illustrations/icons

web/, android/, ios/, windows/  # Platform configs
```

---

### 💡 Navigation Routes

```dart
{
  "/": (context) => const HomePage(),
  "/calculator": (context) => const CalculatorPage(title: "My Calculator"),
  "/to-do": (context) => const TodoPage(),

  // Upcoming:
  // "/calendar": ...
  // "/clock": ...
  // "/notes": ...
  // "/qr-scanner": ...
  // "/weather": ...
}
```

---

### 🛠️ Getting Started

#### Requirements

* Flutter SDK (3.x recommended)
* Dart
* Android Studio / VS Code

#### Run the App

```bash
git clone https://github.com/hadimn/unify_guide.git
cd unify_guide
flutter pub get
flutter run
```

Run for web:

```bash
flutter run -d chrome
```

---

### 📊 Included Reports

* `Call_Center_Analysis_Report.pdf`
* `Call_Center_Performance_Analysis.pdf`
* Visual charts:

  * `call_volume_by_hour.png`
  * `call_volume_by_status.png`

---

### 📦 Dependencies

* `provider` – Theme and state management
* `shared_preferences` – Local storage
* `cupertino_icons` – iOS-style icons
* `flutter_svg` – SVG support

---

### 🔮 Roadmap

* Modular architecture for plug-in tools
* Dark/light theme toggle
* Cloud sync (Firebase or Supabase)
* Offline support for all modules
* Export features (PDF, CSV)
