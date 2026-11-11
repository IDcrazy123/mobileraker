# Upstream stability review (2026-11-10)

The latest upstream release and `master` are both 2.9.14 (`fc74f54`). This
personal build already includes its printer group, IPv6, connection, webcam,
and navigation fixes. Upstream `dev` is 108 commits ahead and has a draft
2.9.15 changelog; it has not been released.

## Backported from upstream `dev`

These small fixes apply to the shared Android code without changing the
personal Pro package:

- Printer timeouts show the retry screen without a duplicate snackbar
  (`0e06618`); retry visibly shows progress (`e4f3faa`).
- A timed-out temperature history request starts with an empty store while
  live updates refill it (`e6ef5af`).
- G-code details disable Print while printing or paused, react when Klipper
  becomes ready, and handle a cleared active spool (`ee20f35`, `dd9b36f`).
- Renaming a file checks its full name and extension without modifying the
  caller's name list (`491d305`).
- Empty macro parameters no longer crash the dialog (`9aab30f`).
- Temperature presets skip the bed command on printers without a bed
  (`662cc11`); removed firmware retraction cards no longer render stale data
  (`856a969`).

## Deferred

The draft 2.9.15 webcam/WebRTC, NFC, Spoolman, macro redesign, and large-screen
changes alter many interfaces, dependencies, or Android build settings. The
personal Pro implementation is separate from the author's private package,
so those features need integration and real Moonraker/Spoolman testing before
they can be imported safely. The Android push-notification fix on `dev`
depends on notification delivery, which this build disables because it has no
Firebase project.

## Build reliability

The checked-in splash resources are retained, but `flutter_native_splash` is
removed from the personal build's development dependencies. Its Android plugin
was included in the generated plugin registry but omitted from the release
classpath, causing a local compilation failure. Regenerate the plugin registry
with `flutter pub get` after this change.
