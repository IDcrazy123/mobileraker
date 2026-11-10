-keep class androidx.lifecycle.DefaultLifecycleObserver

# The personal build uses SharedPreferences during localization startup.
# Keep its Android Pigeon channels intact in the minified release.
-keep class io.flutter.plugins.sharedpreferences.** { *; }
