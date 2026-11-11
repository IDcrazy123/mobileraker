# Mobileraker Personal 2.9.14, Android build 583

Android ARM64 APK for personal use. Package: `com.mobileraker.personal`.

This build keeps the independent Pro implementation and backports selected
stability fixes from Mobileraker's unreleased `dev` branch:

- Printer timeout and retry feedback, plus temperature history timeout recovery.
- Correct Print button state in G-code details and safe handling when the active
  Spoolman spool is cleared.
- File rename validation, empty macro parameters, temperature presets on
  printers without a heated bed, and removed firmware retraction cards.
- Correct Android plugin registration in the release build.

The APK was installed and opened to the Dashboard on an Android emulator after
clearing app data. The two relevant common service test files passed (22 tests).
Printer, webcam, WebRTC, and Spoolman behavior still need testing with real
equipment. This personal build has no Firebase push notification service.

Download the APK attached below to update the earlier personal APK without
removing its app data. GitHub Actions artifacts use a different signing key and
are intended only for build verification.

APK SHA-256: `95440AAD0A75F70EB49D5C7EA9288EEF64ADD6735864EF5E90FF09C0E24A5166`
