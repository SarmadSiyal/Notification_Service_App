# Flutter Local Notifications App 

This is a simple Flutter app built for Flutter Developer Internship at High Tech Software House.

# Features Implemented

- Instant Notification: Press the "Trigger Notification" button to show a local notification immediately, even in the foreground.
- Scheduled Notification: Press the "Schedule Notification (10s)" button to schedule a notification that appears after 10 seconds.
- Cancel All Notifications: Press the "Cancel All Notifications" button to clear all pending and active notifications.
- Countdown Timer: Shows a countdown while waiting for the scheduled notification.
- Foreground Notification Support: Notifications are displayed even when the app is open (foreground).
- Timezone-aware Scheduling: Ensures notifications are scheduled correctly according to the device’s local time zone.
- Custom UI: Clean layout with spacing, gradient background, and icon-based buttons.

# Packages Used

- [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications)
- [`timezone`](https://pub.dev/packages/timezone)
- [`fluttertoast`](https://pub.dev/packages/fluttertoast) (for debugging/toast messages)

# Platform Support

- ✅ Android (fully tested)
- 🟡 iOS (basic support included — requires real device for testing and permission setup in `Info.plist`)

# Setup Instructions

1. Clone the project or download the zip.
2. Run `flutter pub get`.
3. Add the following permissions:

# droid (`AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>

