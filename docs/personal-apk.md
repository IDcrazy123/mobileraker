# Personal Android build

This branch starts from the upstream `master` at `fc74f54` (Mobileraker 2.9.14).
See [upstream-stability-review.md](upstream-stability-review.md) for the selected
fixes backported from the unreleased upstream `dev` branch.
The local `pro/` package adapts the independent, non-commercial implementation
from [westfrost/mobileraker `premium`](https://github.com/westfrost/mobileraker/tree/premium/pro).
The original Mobileraker licenses and copyright notices remain in the repository.

## Included

- Local implementations of Spoolman, Moonraker job queue, printer groups,
  custom themes, dashboard layouts, G-code preview, and a WebView camera player.
- Separate Android package ID: `com.mobileraker.personal`.
- No purchase setup, ads, Firebase account, analytics, crash uploads, or remote
  push notifications. The Android app uses placeholder Firebase configuration
  only to initialize its bundled SDKs. It is not connected to a Firebase project.

These features are independently implemented; they are not the author's private
Pro package. They still need testing with a real Moonraker printer and Spoolman
server. WebRTC uses the stream server's web player and may not support every
camera setup.

## Build

Use Flutter 3.44.4, JDK 17, and the Android SDK. Create the ignored
`android/app/google-services.json` file with the placeholder values in
`.github/workflows/personal-apk.yml`. No personal identifiers or real API keys
are needed. Then run, from the repository root:

```sh
cd common && flutter pub get && dart run build_runner build && cd ..
cd pro && flutter pub get && dart run build_runner build && cd ..
flutter pub get
dart run build_runner build
flutter build apk --release --split-per-abi --target-platform android-arm64
```

The ARM64 APK is `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`.
Tested APKs for personal use are published in the fork's GitHub Releases.
On GitHub, the **Personal APK** workflow builds the same source and attaches
APKs as workflow artifacts. Without `android/key.properties`, builds use the
Android debug signing key; that key can differ between machines or CI runs.
The workflow artifacts are for build verification and may not install as an
update over a locally signed release. Use the APK attached to a Release for
repeatable phone updates.

For repeatable updates on one phone, generate a private release keystore
locally and put its settings in `android/key.properties` (`storeFile`,
`storePassword`, `keyAlias`, `keyPassword`). Both the keystore and properties
file are ignored by Git. Keep a private backup: losing the key prevents an
update over an APK signed with it. Never commit the key or passwords.
