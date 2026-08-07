# 📱 APK Security Scanner — Flutter App

A mobile client for the **APK Security Scanner** backend — upload any Android APK, watch it get analyzed in real time, and get a full security report with severity-ranked findings, right from your phone.

Built with Flutter, connected to a Flask/Androguard-powered backend for static APK analysis.

---

## ✨ Features

- 📤 **Upload APK Files** — pick any `.apk` file (up to 200 MB) directly from the device.
- 🔄 **Live Scan Progress** — real-time analysis log showing each stage: extracting the archive, parsing the manifest, analyzing permissions, decompiling DEX bytecode, detecting secrets, scanning endpoints, checking cryptography usage, auditing storage, reviewing exported components, and generating the report.
- 📋 **Full Security Report** — scan metadata (package name, version, target/min SDK, file size, SHA-256) plus findings grouped by severity: **Critical, High, Medium, Low**.
- ⚠️ **Detailed Findings** — each issue includes a plain-language description and the exact file/line where it was found (e.g. hardcoded API keys, insecure data storage).
- 📄 **Export & Share Reports** — export the full report as a PDF or share it directly from the app.
- 👤 **User Profile** — account info, app version, scanner engine status, and support contact.
- 🔐 **Authentication** — secure sign-in via Firebase Auth.

---

## 🏗️ Tech Stack

| Layer | Tools |
|---|---|
| Framework | Flutter |
| State Management | `flutter_bloc` / `bloc` |
| Routing | `go_router` |
| Dependency Injection | `get_it` |
| Networking | `dio` |
| Auth & Backend Services | `firebase_core`, `firebase_auth` |
| Functional Error Handling | `dartz`, `equatable` |
| File Handling | `file_picker`, `path_provider` |
| PDF Reports | `pdf`, `share_plus` |
| Fonts / UI | `google_fonts` |

The app follows a **Clean Architecture** approach (data / domain / presentation layers), using BLoC for state management and `dartz`'s `Either` type for functional error handling.

---

## 📱 App Screens

1. **Dashboard** — landing screen with a single "Upload APK File" action.
2. **Scan Progress** — live analysis log with a progress bar as the backend processes the APK (manifest parsing, permission analysis, DEX decompilation, secrets detection, endpoint scanning, crypto checks, storage audit, exported components review, report generation).
3. **Full Report** — scrollable report view with scan metadata at the top, followed by findings grouped by severity (Critical first), each with a description and source location. Includes **Export PDF** and **Share** actions.
4. **Profile** — account details, app version, scanner engine status, and support info.

---

## ⚙️ How It Works

1. The user uploads an `.apk` file via `file_picker`.
2. The file is sent to the backend (`POST /scan`) using `dio`.
3. The backend (Flask + Androguard) runs static analysis: manifest parsing, permissions, hardcoded secrets, insecure endpoints, exported components, and severity classification.
4. The app receives a JSON report and renders it in the **Full Report** screen.
5. The user can export the report as a PDF (generated client-side with the `pdf` package, or downloaded from the backend) and share it via `share_plus`.

---

## 🔧 Getting Started

### Prerequisites
- Flutter SDK `^3.10.4`
- A running instance of the [APK Security Scanner backend](#) (Flask API)
- A configured Firebase project (for authentication)

### Installation

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd apk_scanner

# 2. Install dependencies
flutter pub get

# 3. Add Firebase configuration files
#    - android/app/google-services.json
#    - ios/Runner/GoogleService-Info.plist

# 4. Set the backend API base URL (in your dio client / env config)

# 5. Run the app
flutter run
```

---

## ⚠️ Disclaimer

This app is a client for a **static analysis only** backend (no APK execution/dynamic analysis). Scan results should be treated as a starting point for a security review, not a certified audit.

---

## 📌 Notes

- Uploaded APKs are processed server-side and deleted automatically after each scan — only the generated report is kept.
- Sensitive values (API keys, tokens) are masked in the report before being sent to the app.
